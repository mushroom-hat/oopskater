# ICT2207 Obfuscator Project

import os
from time import sleep

from PyQt5.QtCore import pyqtSignal

import obfuscate_java
import obfuscate_smali
import obfuscate_smali_files
# import obfuscate_java

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QFileDialog
import subprocess
import sys

# TO-DO
# get apk name, check for existing folders after recompiling, catch errors by JAVA apktool

OUTPUT_FOLDER_PATH = ""  # the absolute path of folder where all decompiled files and recompiled APK will be stored at
TARGET_FOLDER_PATH = ""
APPLICATION_NAME = ""
DECODED_APK_PATH = ""
SELECTED_ALGORITHM = ""
UI_THREAD = None


# decompile supplied .apk using apktool
def decompile_apk(filepath):
    global APPLICATION_NAME
    try:
        print("Filepath :", filepath)
        APPLICATION_NAME = (str(filepath.split("\\")[-1])).split(".")[0]
        print("\n===== DECOMPILING FROM APK =====")
        os.system("JAVA -jar resources/APK/apktool.jar d \"{}\"".format(filepath))
        decompiled_directory = filepath.split(".")[0]
        decompiled_directory = decompiled_directory.split('\\')
        decompiled_directory = '\\'.join([x for x in decompiled_directory if x != 'assets' and x != ''])
        print("File Directory :", decompiled_directory)
        print("APK successfully decompiled to {}".format(decompiled_directory))

        return decompiled_directory
    except Exception as e:
        print(e)


# recompile a directory of JAVA/kotlin source codes OR smali files into an apk
# MUST SUPPLY FOLDER_PATH (containing obfuscated code)
def recompile():
    global UI_THREAD
    UI_THREAD.emit("Recompiling APK")
    if TARGET_FOLDER_PATH != "":
        try:
            print("===== COMPILING BACK TO APK =====")
            os.system("JAVA -jar resources/APK/apktool.jar b \"{}\" --use-aapt2".format(TARGET_FOLDER_PATH))
            print("APK successfully recompiled to {}\\dist\\".format(TARGET_FOLDER_PATH))
        except Exception as e:
            print(e)
    else:
        print("Something went wrong")


# enumerate directories for JAVA/kotlin source code or smali files, returns a list of relevant files
def enumerate_directories(folderpath):
    global UI_THREAD
    UI_THREAD.emit("Enumerating Directory")
    list_of_java_files = []
    list_of_smali_files = []
    list_of_kt_files = []

    for root, directories, files in os.walk(folderpath):
        for file in files:

            # check file using their extensions for smali/JAVA/kotlin files
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
    android_internal_files = ['\\androidx', '\\android', '\\kotlin', '\\google', '\\org', '\\us\\', '\\de\\',
                              '\\sqldelight\\'
        , '\\markdown\\', '\\unity3d\\', '\\sdk\\']
    print("Looping Folder Directory to look for smali files.....")
    list_of_cleaned_smali_files = []
    try:
        list_of_smali_files = find_smali_files(dir)
        for file_path in list_of_smali_files:
            filtered_file_path = clean_smali_files_path(file_path)
            if all(x not in filtered_file_path for x in
                   android_internal_files) and APPLICATION_NAME in filtered_file_path:
                list_of_cleaned_smali_files.append(filtered_file_path)
    except:
        print("Something went wrong finding smali files.")

    try:
        obfuscate_smali_files.backup_files(list_of_cleaned_smali_files)
        obfuscate_smali.change_all_file(list_of_cleaned_smali_files, len(list_of_cleaned_smali_files), APPLICATION_NAME,
                                        UI_THREAD, SELECTED_ALGORITHM)
        obfuscate_smali_files.generate_new_files(list_of_cleaned_smali_files)
        return 1
    except:
        print("Something went wrong obfuscating.")
        UI_THREAD.emit("Something went wrong obfuscating.")
        return 0


def clean_smali_files_path(file_path):
    global UI_THREAD
    UI_THREAD.emit("Cleaning Smali Files Paths ... ")
    obj = file_path.split("\\")
    return "\\".join(list(filter(lambda x: x != "", obj)))


def process_importedFile(importedFile, ui_thread, selected_algorithm):
    global TARGET_FOLDER_PATH, UI_THREAD, SELECTED_ALGORITHM
    SELECTED_ALGORITHM = selected_algorithm
    UI_THREAD = ui_thread
    TARGET_FOLDER_PATH = importedFile

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
    # ---- OBFUSCATION PART
    if TARGET_FOLDER_PATH != "":
        if java_files:
            obfuscate_java.obfuscate(TARGET_FOLDER_PATH)
        elif smali_files:
            if obfuscate_smali_file(TARGET_FOLDER_PATH):
                # lastly, recompile it back to APK
                recompile()
        return 1
