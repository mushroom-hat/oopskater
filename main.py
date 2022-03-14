# ICT2207 Obfuscator Project

import os
import obfuscate_smali
import obfuscate_java

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QFileDialog
import subprocess
import sys

# TO-DO
# get apk name, check for existing folders after recompiling, catch errors by java apktool

OUTPUT_FOLDERPATH = ""  # the absolute path of folder where all decompiled files and recompiled APK will be stored at
TARGET_FOLDERPATH = ""



# decompile supplied .apk using apktool
def decompile_apk(filepath):
    try:
        print("===== DECOMPILING FROM APK =====")
        os.system("java -jar apktool.jar d \"{}\"".format(filepath))
        decompiled_directory = filepath.split(".")[0]
        print("APK successfully decompiled to {}".format(decompiled_directory))
        return decompiled_directory
    except Exception as e:
        print(e)


# recompile a directory of java/kotlin source codes OR smali files into an apk
# MUST SUPPLY FOLDERPATH (containing obfuscated code)
def recompile():
    if TARGET_FOLDERPATH != "":
        try:
            print("===== COMPILING BACK TO APK =====")
            os.system("java -jar apktool.jar b \"{}\"".format(TARGET_FOLDERPATH))
            print("APK successfully recompiled to {}\\dist\\".format(TARGET_FOLDERPATH))

        except Exception as e:
            print(e)
    else:
        print("Something went wrong")


# enumerate directories for java/kotlin source code or smali files, returns a list of relevant files
def enumerate_directories(folderpath):
    list_of_java_files = []
    list_of_smali_files = []
    list_of_kt_files = []

    for root, directories, files in os.walk(folderpath):
        for file in files:

            # check file using their extensions for smali/java/kotlin files
            if file.lower().endswith('.java'):
                list_of_java_files.append(os.path.join(root, file))

            if file.endswith('.kt'):
                list_of_kt_files.append(os.path.join(root, file))

            elif file.lower().endswith('.smali'):
                list_of_smali_files.append(os.path.join(root, file))

    return list_of_java_files, list_of_kt_files, list_of_smali_files


def process_importedFile(importedFile):
    global TARGET_FOLDERPATH

    TARGET_FOLDERPATH = importedFile
    # if apk is supplied, decompile the apk into current directory
    if importedFile.endswith('.apk'):
        decompiled_directory = decompile_apk(importedFile)
        TARGET_FOLDERPATH = decompiled_directory

    # if file supplied is not an apk, it means it is a folder containing either android source code or smali files
    # proceed to enumerate the supplied folder for relevant files
    java_files, kt_files, smali_files = enumerate_directories(TARGET_FOLDERPATH)
    if not java_files and not kt_files and not smali_files:
        return "No Smali/Java/Kotlin files found"

    for file in java_files:
        print(file)
        f = open(file, "r")
        for lines in f.readlines():
            # strip line spaces at the end
            lines = lines.rstrip()

            if ";" in lines:

                print(lines.strip("\n"))

    # ---- OBFUSCATION PART


    if TARGET_FOLDERPATH != "":
        # lastly, recompile it back to APK
        #recompile()
        return "Success"



