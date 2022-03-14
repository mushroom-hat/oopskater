import re
import fileinput
import random
from os import remove
from shutil import move
from urllib3.connectionpool import xrange
import threading
from queue import Queue

NOP_REPLACEMENT_COUNT = 0
FILE = 0
NOP_VALID_OP_CODE_LIST=1

def remove_new_line(file):
    with open(file, "r+") as in_file:
        content = in_file.readlines()
        content = [line for line in content]
        content = [line.replace('\n', '') for line in content]
        content = "".join(list(filter(lambda x: x != "", content)))
        in_file.seek(0)
        in_file.write(content)
        in_file.truncate()


def get_text_file(file_name):  # Get a text from a file
    try:
        with open(file_name) as file_list:
            return file_list.read()
    except IOError as e:
        raise e.LoadFileException(str(e) + '\nUnable to load ' + file_name)


def get_text_as_list(file_name):  # Get a text file as line-per-line list
    return get_text_file(file_name).splitlines()

def get_valid_op_code():  # Get the valid opcode list
    return get_text_as_list('resources/nopValidOpCode.txt')

def open_file_input(file_name):  # Open a file for inline editing
    try:
        return fileinput.input(file_name)
    except IOError as e:
        raise e.LoadFileException(str(e)+'\nUnable to edit inplace file ' + file_name)

def random_nop_interval():  # Randomize the number of nop(s)
    return random.sample(xrange(3), 1)[0]+1


def threader(my_queue):
    # This function will get the item from the queue and run the function add_nop_in_method()
    while True:
        item = my_queue.get()
        add_nop_in_method(item[FILE], item[NOP_VALID_OP_CODE_LIST])
        remove_new_line(item[FILE])
        my_queue.task_done()


def change_all_file(smali_file_list, file_list_size):
    """Add the nop in all the smali class file"""
    """Whack all the function haha"""
    global NOP_REPLACEMENT_COUNT
    my_queue = Queue()
    # This function will create the worker/threads
    for x in range(100):
        t = threading.Thread(target=threader, args=(my_queue,))
        t.daemon = True
        t.start()

    print("Total Number of Files to Scan: " + str(file_list_size))
    print("Average waiting time: " + str((file_list_size / 60) / 2) + " seconds.")
    print("Generating Junk NOP...")
    opcode_list = get_valid_op_code()

    my_file = open('file_list.txt','w')
    for item in smali_file_list:
        my_file.write(item+'\n')
    my_file.close

    for smali_file in smali_file_list:  # For each file
        my_queue.put([smali_file, opcode_list])
        # remove_new_line(smali_file)
    my_queue.join()
    print("Total Number of files with generated NOP: " + str(NOP_REPLACEMENT_COUNT))
    print("Removing all new lines...")


def add_nop_in_method(smali_file, valid_op_code):
    """Add multiple nop sequence of random length (1-3) between two nop-valid instruction"""
    global NOP_REPLACEMENT_COUNT
    count = 0
    overwrite_flag = False

    """Generate new temp file to be accessed, due to multithreaded. It might access the same file name, therefore causing an error"""
    file_name_item = str(smali_file).split("\\")
    file_name = file_name_item.pop()
    file_name = "new_" + file_name
    file_name_item.append(file_name)
    file_name = "\\".join(file_name_item)


    with open(smali_file,'r+') as in_file, open(file_name, 'w') as out_file:
        smali_content = in_file.readlines()
        for smali_line in smali_content:
            out_file.write(smali_line)
            try:
                line_op_code = re.search(r'^([ ]*)(?P<opCode>([^ ]+)) ', smali_line)
                if line_op_code is not None:
                    op_code = line_op_code.group('opCode')
                    if op_code in valid_op_code:
                        nop_count = random_nop_interval()  # Randomize the number of nop(s)
                        out_file.write('    nop\n' * nop_count)
                        overwrite_flag = True
                count += 1
            except:
                print("Error writing NOP to : " + smali_file)
                count += 1
                pass

    if overwrite_flag:
        remove(smali_file)
        move(file_name,smali_file)
        NOP_REPLACEMENT_COUNT +=1
    else:
        remove(file_name)


