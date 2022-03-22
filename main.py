# ICT2207 Obfuscator Project

import os
from time import sleep

from PyQt5.QtCore import pyqtSignal

import obfuscate_smali
import obfuscate_smali_files
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
DECODED_APK_PATH = ""
UI_THREAD = None


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
# MUST SUPPLY FOLDER_PATH (containing obfuscated code)
def recompile():
    global UI_THREAD
    UI_THREAD.emit("Recompiling APK")
    if TARGET_FOLDER_PATH != "":
        try:
            print("===== COMPILING BACK TO APK =====")
            os.system("java -jar apktool.jar b \"{}\"".format(TARGET_FOLDER_PATH))
            print("APK successfully recompiled to {}\\dist\\".format(TARGET_FOLDER_PATH))
            # print("===== GENERATING APK KEY =====")
            # os.system("keytool -genkey -v -keystore signing.keystore -keyalg RSA -keysize 2048 -validity 10000")
            print("===== SIGNING APK w key =====")
            os.system("build-tools\\32.0.0\\apksigner.bat sign --ks signing.keystore --ks-pass pass:123123 " + APPLICATION_NAME  + "\\dist\\" + APPLICATION_NAME + ".apk")



        except Exception as e:
            print(e)
    else:
        print("Something went wrong")


# enumerate directories for java/kotlin source code or smali files, returns a list of relevant files
def enumerate_directories(folderpath):
    global UI_THREAD
    UI_THREAD.emit("Enumerating Directory")
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
    global UI_THREAD
    UI_THREAD.emit("Finding Smali Files ... ")
    files_list = []
    extensions = ('.smali')
    for subdir, dirs, files in os.walk(dir):
        for file in files:
            ext = os.path.splitext(file)[-1].lower()
            if ext in extensions:
                files_list.append(os.path.join(subdir, file))
    return files_list


def obfuscate_smali_file(dir):
    global UI_THREAD
    UI_THREAD.emit("Obfuscating Smali Files ... ")
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

    obfuscate_smali_files.backup_files(list_of_cleaned_smali_files)
    obfuscate_smali.change_all_file(list_of_cleaned_smali_files, len(list_of_cleaned_smali_files), APPLICATION_NAME, dir)
    obfuscate_smali_files.generate_new_files(list_of_cleaned_smali_files)






def clean_smali_files_path(file_path):
    global UI_THREAD
    UI_THREAD.emit("Cleaning Smali Files Paths ... ")
    obj = file_path.split("\\")
    return "\\".join(list(filter(lambda x: x != "", obj)))


def process_importedFile(importedFile, ui_thread):
    global TARGET_FOLDER_PATH, UI_THREAD
    UI_THREAD = ui_thread
    TARGET_FOLDER_PATH = importedFile
    print("Starting import")
    # if apk is supplied, decompile the apk into current directory
    if importedFile.endswith('.apk'):
        ui_thread.emit("Decompiling APK ... ")
        decompiled_directory = decompile_apk(importedFile)
        TARGET_FOLDER_PATH = decompiled_directory

    # if file supplied is not an apk, it means it is a folder containing either android source code or smali files
    # proceed to enumerate the supplied folder for relevant files
    java_files, kt_files, smali_files = enumerate_directories(TARGET_FOLDER_PATH)
    if not java_files and not kt_files and not smali_files:
        ui_thread.emit("No Smali/Java/Kotlin files found")
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
        return 1



