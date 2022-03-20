# ICT2207 Obfuscator Project

import os
import obfuscate_smali
# import obfuscate_java

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QFileDialog
import subprocess
import sys

# TO-DO
# get apk name, check for existing folders after recompiling, catch errors by java apktool

OUTPUT_FOLDER_PATH = ""  # the absolute path of folder where all decompiled files and recompiled APK will be stored at
TARGET_FOLDER_PATH = ""
APPLICATION_NAME = ""



# decompile supplied .apk using apktool
def decompile_apk(filepath):
    global APPLICATION_NAME
    try:
        APPLICATION_NAME = (str(filepath.split("\\")[-1])).split(".")[0]
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
    if TARGET_FOLDER_PATH != "":
        try:
            print("===== COMPILING BACK TO APK =====")
            os.system("java -jar apktool.jar b \"{}\"".format(TARGET_FOLDER_PATH))
            print("APK successfully recompiled to {}\\dist\\".format(TARGET_FOLDER_PATH))
            print("===== GENERATING APK KEY =====")
            os.system("keytool -genkey -v -keystore signing.keystore -keyalg RSA -keysize 2048 -validity 10000")
            print("===== SIGNING APK w key =====")
            os.system("build-tools\\32.0.0\\apksigner.bat sign --ks signing.keystore " + APPLICATION_NAME  + "\\dist\\" + APPLICATION_NAME + ".apk")



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

def find_smali_files(dir):
    files_list = []
    extensions = ('.smali')
    for subdir, dirs, files in os.walk(dir):
        for file in files:
            ext = os.path.splitext(file)[-1].lower()
            if ext in extensions:
                files_list.append(os.path.join(subdir, file))
    return files_list


def obfuscate_smali_file(dir):
    # # Getting all smali fies in the directory
    global APPLICATION_NAME
    android_internal_files = ['\\androidx', '\\android','\\kotlin', '\\google', '\\org', '\\us\\', '\\de\\', '\\sqldelight\\'
                              ,'\\markdown\\']
    print("Looping Folder Directory to look for smali files.....")
    try:
        list_of_smali_files = find_smali_files(dir)

        list_of_cleaned_smali_files = []
        for file_path in list_of_smali_files:
            filtered_file_path = clean_smali_files_path(file_path)
            if all(x not in filtered_file_path for x in android_internal_files) and APPLICATION_NAME in filtered_file_path:
                list_of_cleaned_smali_files.append(filtered_file_path)
    except:
        print("Something went wrong finding smali files.")
    obfuscate_smali.change_all_file(list_of_cleaned_smali_files, len(list_of_cleaned_smali_files), APPLICATION_NAME)




def clean_smali_files_path(file_path):
    obj = file_path.split("\\")
    return "\\".join(list(filter(lambda x: x != "", obj)))


def process_importedFile(importedFile):
    global TARGET_FOLDER_PATH
    TARGET_FOLDER_PATH = importedFile
    # if apk is supplied, decompile the apk into current directory
    if importedFile.endswith('.apk'):
        decompiled_directory = decompile_apk(importedFile)
        TARGET_FOLDER_PATH = decompiled_directory

    # if file supplied is not an apk, it means it is a folder containing either android source code or smali files
    # proceed to enumerate the supplied folder for relevant files
    java_files, kt_files, smali_files = enumerate_directories(TARGET_FOLDER_PATH)
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
    if TARGET_FOLDER_PATH != "":
        obfuscate_smali_file(TARGET_FOLDER_PATH)
        # lastly, recompile it back to APK
        recompile()
        return "Success"



