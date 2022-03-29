import os
import threading
from cryptography.fernet import Fernet

# Import custom function
import obfuscate_smali_nop
import obfuscate_smali_goto
import obfuscate_smali_debug_removal
import obfuscate_smali_overloading
import obfuscate_smali_field_renaming
import obfuscate_smali_reflection
import time
from queue import Queue

import obfuscate_smali_stringenc

NOP_REPLACEMENT_COUNT = 0
DEBUG_REPLACEMENT_COUNT = 0
OVERLOADING_REPLACEMENT_COUNT = 0
STRING_ENCRYPTION_COUNT = 0
RENAME_COUNT = 0
GOTO_COUNT = 0

NOP_TIME_LIST = []
STR_ENCRYPT_TIME_LIST = []
DEBUG_TIME_LIST = []
GOTO_TIME_LIST = []
RENAME_TIME = 0
REFLECTION_TIME = 0
OVERLOADING_TIME = 0

ENC_SECRET = ""
ANDROID_MANIFEST_FILE = "AndroidManifest.xml"
ANDROID_MANIFEST_TREE = None
ANDROID_MANIFEST_ROOT = None
APPLICATION_NAME = ""



def threader(my_queue):
    # This function will get the item from the queue and run the function add_nop_algorithm()
    global NOP_REPLACEMENT_COUNT
    global DEBUG_REPLACEMENT_COUNT
    global OVERLOADING_REPLACEMENT_COUNT
    global STRING_ENCRYPTION_COUNT
    global ENC_SECRET
    global NOP_TIME_LIST, STR_ENCRYPT_TIME_LIST, DEBUG_TIME_LIST
    ENC_SECRET = genSec(32)
    # ENC_SECRET = "This-key-need-to-be-32-character"
    while True:

        file = my_queue.get()

        time_obj = time.time()
        status_strEnc = obfuscate_smali_stringenc.encrypt(file, ENC_SECRET)
        if status_strEnc:
            STRING_ENCRYPTION_COUNT += 1
        STR_ENCRYPT_TIME_LIST.append(time.time() - time_obj)

        time_obj = time.time()
        status_debug = obfuscate_smali_debug_removal.add_debug_algorithm(file)
        if status_debug:
            DEBUG_REPLACEMENT_COUNT += 1
        DEBUG_TIME_LIST.append(time.time() - time_obj)

        time_obj = time.time()
        status_nop = obfuscate_smali_nop.add_nop_algorithm(file)
        if status_nop:
            NOP_REPLACEMENT_COUNT += 1
        NOP_TIME_LIST.append(time.time() - time_obj)

        my_queue.task_done()


def change_all_file(smali_file_list, file_list_size, application_name, ui_thread):
    global APPLICATION_NAME, ANDROID_MANIFEST_FILE
    global RENAME_COUNT, NOP_REPLACEMENT_COUNT, DEBUG_REPLACEMENT_COUNT, OVERLOADING_REPLACEMENT_COUNT, \
        STRING_ENCRYPTION_COUNT, GOTO_COUNT
    global NOP_TIME_LIST, DEBUG_TIME_LIST, STR_ENCRYPT_TIME_LIST, GOTO_TIME_LIST, RENAME_TIME, \
        REFLECTION_TIME, OVERLOADING_TIME

    ANDROID_MANIFEST_FILE = "\\" + application_name + "\\" + ANDROID_MANIFEST_FILE
    APPLICATION_NAME = application_name

    print("Application Name:", APPLICATION_NAME)


    """============================================="""
    """ ======= Creating Multi Thread Queue ========"""
    """============================================="""
    my_queue = Queue()
    # This function will create the worker/threads
    for x in range(100):
        t = threading.Thread(target=threader, args=(my_queue,))
        t.daemon = True
        t.start()

    print("\n=============== Obfuscating Smali Files ===============")
    print("Total Number of Files to Scan: " + str(file_list_size))

    """ For Jia Zhe debugging purposes. """
    my_file = open('obfuscated_file_list.txt', 'w')
    for item in smali_file_list:
        my_file.write(item + '\n')
    my_file.close

    """===================================================="""
    """ Adding NOP, Overloading. Removing Debugging lines. """
    """===================================================="""
    """ Multi threaded single file tasks """
    ui_thread.emit("Adding NOP / Overloading, and removing debugging lines to Smali Files ... ")
    for smali_file in smali_file_list:  # For each file
        my_queue.put(smali_file)
    my_queue.join()

    """============================================="""
    """ =========== Adding GOTO Statements =========="""
    """============================================="""
    GOTO_COUNT = 0
    ui_thread.emit("Adding GOTO Statements to Smali Files ... ")
    for smali_file in smali_file_list:
        time_obj = time.time()
        if obfuscate_smali_goto.add_goto_algorithm(smali_file):
            GOTO_COUNT += 1
        GOTO_TIME_LIST.append(time.time() - time_obj)

    """=========================================================="""
    """ ======== Rename, Overloading Reflection Feature  ======="""
    """========================================================="""
    ui_thread.emit("Adding Rename, Overloading Reflection algorithm over Smali Files ... ")
    rename_start_time = time.time()
    RENAME_COUNT = obfuscate_smali_field_renaming.add_renaming_field_algorithm(smali_file_list)
    RENAME_TIME = (time.time() - rename_start_time) / len(smali_file_list)

    overloading_start_time = time.time()
    OVERLOADING_REPLACEMENT_COUNT = obfuscate_smali_overloading.add_method_overloading_algorithm(smali_file_list, [], 2)
    OVERLOADING_TIME = (time.time() - overloading_start_time) / len(smali_file_list)

    reflection_start_time = time.time()
    obfuscate_smali_reflection.add_reflection_algorithm(smali_file_list)
    REFLECTION_TIME = (time.time() - reflection_start_time) / len(smali_file_list)

    if STRING_ENCRYPTION_COUNT > 0:
        # add decryptstring file to app
        destination_dir = os.path.dirname(smali_file_list[-1])
        destination_file = os.path.join(destination_dir, "DecryptString.smali")
        # print("insertingFile with"+ENC_SECRET)
        with open(
                destination_file, "w", encoding="utf-8"
        ) as decrypt_string_smali:
            decrypt_string_smali.write(
                obfuscate_smali_stringenc.get_decrypt_string_smali_code(ENC_SECRET)
            )

    print_statistics()


def print_statistics():
    global RENAME_COUNT, NOP_REPLACEMENT_COUNT, DEBUG_REPLACEMENT_COUNT, OVERLOADING_REPLACEMENT_COUNT, \
        STRING_ENCRYPTION_COUNT, GOTO_COUNT
    global NOP_TIME_LIST, STR_ENCRYPT_TIME_LIST, DEBUG_TIME_LIST, GOTO_TIME_LIST, RENAME_TIME, \
        OVERLOADING_TIME, REFLECTION_TIME

    print("\n============ Obfuscation Statistics =======================")
    print("Total Number of line fields renamed: " + str(RENAME_COUNT))
    print("Total Number of files with generated NOP: " + str(NOP_REPLACEMENT_COUNT))
    print("Total Number of files with removed debugging line: " + str(DEBUG_REPLACEMENT_COUNT))
    print("Total Number of files with overloading features added: " + str(OVERLOADING_REPLACEMENT_COUNT))
    print("Total Number of files with goto lines added: " + str(GOTO_COUNT))
    print("Total Number of files with encrypted strings: " + str(STRING_ENCRYPTION_COUNT))

    nop_time = 0
    for time_item in NOP_TIME_LIST:
        nop_time += time_item
    print("-------------------------------------------------------------------------------------------")
    print("Average Time taken to obfuscate smali file with NOP algorithm: " + str(nop_time / len(NOP_TIME_LIST)))
    print("Total Time in NOP Algorithm: " + str(nop_time))
    print("-------------------------------------------------------------------------------------------")

    str_encrypt_time = 0
    for time_item in STR_ENCRYPT_TIME_LIST:
        str_encrypt_time += time_item
    print("Average Time taken to obfuscate smali file with String Encryption algorithm: " + str(
        str_encrypt_time / len(STR_ENCRYPT_TIME_LIST)))
    print("Total Time in String Encryption Algorithm: " + str(str_encrypt_time))
    print("-------------------------------------------------------------------------------------------")

    debug_time = 0
    for time_item in DEBUG_TIME_LIST:
        debug_time += time_item
    print("Average Time taken to obfuscate smali file with Removing Debugging Line algorithm: " + str(
        debug_time / len(DEBUG_TIME_LIST)))
    print("Total Time in Removing Debugging Line algorithm: " + str(debug_time))
    print("-------------------------------------------------------------------------------------------")

    goto_time = 0
    for time_item in GOTO_TIME_LIST:
        goto_time += time_item
    print("Average Time taken to obfuscate smali file with Adding GOTO Statements algorithm: " + str(
        goto_time / len(GOTO_TIME_LIST)))
    print("Total Time in Adding GOTO Statements algorithm: " + str(goto_time))
    print("-------------------------------------------------------------------------------------------")

    print("Average Time taken to obfuscate smali file with Renaming algorithm: " + str(
        RENAME_TIME))

    print("Average Time taken to obfuscate smali file with Overloading algorithm: " + str(
        OVERLOADING_TIME))

    print("Average Time taken to obfuscate smali file with Reflection algorithm: " + str(
        REFLECTION_TIME))

    print("\n")


def genSec(size):
    keysec = str(Fernet.generate_key())
    se = "".join(ch for ch in keysec if ch.isalnum())
    keysec = se[2:size + 2]
    return keysec
