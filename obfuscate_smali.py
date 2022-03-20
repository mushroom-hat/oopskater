import os
import threading
import hashlib
import util
from typing import List, Set, Dict, Union
from os import walk
import xml.etree.cElementTree as Xml


# Import custom function
import obfuscate_smali_nop
import obfuscate_smali_goto
import obfuscate_smali_debug_removal
import obfuscate_smali_overloading
import obfuscate_smali_renaming
import time
from queue import Queue

import obfuscate_smali_stringenc

NOP_REPLACEMENT_COUNT = 0
DEBUG_REPLACEMENT_COUNT = 0
OVERLOADING_REPLACEMENT_COUNT = 0
STRING_ENCRYPTION_COUNT =0
ENC_SECRET = ""
ANDROID_MANIFEST_FILE = "AndroidManifest.xml"
ANDROID_MANIFEST_TREE = None
ANDROID_MANIFEST_ROOT = None
APPLICATION_NAME = ""


def remove_new_line(file):
    with open(file, "r+") as in_file:
        content = in_file.readlines()
        content = [line for line in content]
        content = [line.replace('\n', '') for line in content]
        content = "".join(list(filter(lambda x: x != "", content)))
        in_file.seek(0)
        in_file.write(content)
        in_file.truncate()



def threader(my_queue):
    # This function will get the item from the queue and run the function add_nop_in_method()
    global NOP_REPLACEMENT_COUNT
    global DEBUG_REPLACEMENT_COUNT
    global OVERLOADING_REPLACEMENT_COUNT
    global STRING_ENCRYPTION_COUNT
    global ENC_SECRET
    ENC_SECRET = "This-key-need-to-be-32-character"
    while True:
        file = my_queue.get()
        status_nop = obfuscate_smali_nop.add_nop_in_method(file)
        if status_nop:
            NOP_REPLACEMENT_COUNT += 1
        status_strEnc = obfuscate_smali_stringenc.encrypt(file,ENC_SECRET)
        if status_strEnc:
            STRING_ENCRYPTION_COUNT += 1
        status_debug = obfuscate_smali_debug_removal.debugRemoval(file)
        if status_debug:
            DEBUG_REPLACEMENT_COUNT += 1
        # remove_new_line(item[FILE])
        my_queue.task_done()


def change_all_file(smali_file_list, file_list_size, application_name):
    global APPLICATION_NAME
    global ANDROID_MANIFEST_FILE
    ANDROID_MANIFEST_FILE = "\\" + application_name + "\\" + ANDROID_MANIFEST_FILE
    APPLICATION_NAME = application_name
    start_time = time.time()

    """Add the nop in all the smali class file"""
    """Whack all the function haha"""
    my_queue = Queue()
    # This function will create the worker/threads
    for x in range(100):
        t = threading.Thread(target=threader, args=(my_queue,))
        t.daemon = True
        t.start()

    print("Total Number of Files to Scan: " + str(file_list_size))


    # """============================================="""
    # """ ======== Rename Feature Declarations========"""
    # """============================================="""
    # print("Trying to rename some statements/declarations....")
    # if obfuscate_smali_renaming.rename(ANDROID_MANIFEST_FILE, smali_file_list):
    #     print("Renaming went well.")
    # else:
    #     print("Something went wrong with renaming... Exiting...")




    print("Generating Junk NOP and Removing Debugging lines...")
    print("Average waiting time: " + str((file_list_size / 60) / 2) + " seconds.")


    """ For Jia Zhe debugging purposes. """
    my_file = open('file_list.txt', 'w')
    for item in smali_file_list:
        my_file.write(item + '\n')
    my_file.close

    """===================================================="""
    """ Adding NOP, Overloading. Removing Debugging lines. """
    """===================================================="""
    """ Multi threaded single file tasks """
    for smali_file in smali_file_list:  # For each file
        my_queue.put(smali_file)
        # remove_new_line(smali_file)
    my_queue.join()

    OVERLOADING_REPLACEMENT_COUNT = obfuscate_smali_overloading.add_method_overloads(smali_file_list, [], 2)

    print("Total Number of files with generated NOP: " + str(NOP_REPLACEMENT_COUNT))
    print("Total Number of files with removed debugging line: " + str(DEBUG_REPLACEMENT_COUNT))
    print("Total Number of files with overloading features added: " + str(OVERLOADING_REPLACEMENT_COUNT))
    print("Total Number of files with encrypted strings: "+str(STRING_ENCRYPTION_COUNT))
    if(STRING_ENCRYPTION_COUNT>0):
        # Add to the app the code for decrypting the encrypted strings. The code
        # for decrypting can be put in any smali directory, since it will be
        # moved to the correct directory when rebuilding the application.
        destination_dir = os.path.dirname(smali_file)
        destination_file = os.path.join(destination_dir, "DecryptString.smali")
        with open(
                destination_file, "w", encoding="utf-8"
        ) as decrypt_string_smali:
            decrypt_string_smali.write(
                obfuscate_smali_stringenc.get_decrypt_string_smali_code(ENC_SECRET)
            )


    """============================================="""
    """ ===========Adding GOTO Statements =========="""
    """============================================="""
    goto_count = 0
    print("Adding Goto statements....")
    for smali_file in smali_file_list:
        if (obfuscate_smali_goto.add_goto(smali_file)):
            goto_count += 1
    print("Total files added with goto statement: " + str(goto_count))



    end_time = time.time()
    print("Total execution time: " + str(end_time - start_time))


