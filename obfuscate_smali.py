import re
import fileinput
import random
from os import remove
from shutil import move
from urllib3.connectionpool import xrange



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

def change_all_file(smali_file_list):
    """Add the nop in all the smali class file"""
    """Whack all the function haha"""
    print("Generating Junk NOP...")
    for smali_file in smali_file_list:  # For each file
        add_nop_in_method(smali_file, get_valid_op_code())
        remove_new_line(smali_file)
    print("Removing all new lines...")


def add_nop_in_method(smali_file, valid_op_code):
    """Add multiple nop sequence of random length (1-3) between two nop-valid instruction"""
    count = 0
    overwrite_flag = False
    with open(smali_file,'r+') as in_file, open("temp123123.txt", 'w') as out_file:
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
        print("Writing NOP to : " + smali_file)
        remove(smali_file)
        move("temp123123.txt",smali_file)


    # count = 0
    # for smali_line in open_file_input(smali_file):  # For each line
    #     line_op_code = re.search(r'^([ ]*)(?P<opCode>([^ ]+)) ', smali_line)
    #     if line_op_code is not None:
    #         op_code = line_op_code.group('opCode')
    #         if op_code in valid_op_code:
    #             if count == 0:
    #                 print("Writing NOP to : " + smali_file)
    #                 count +=1
    #                 nop_count = random_nop_interval()  # Randomize the number of nop(s)
    #                 print('    nop\n' * nop_count)
    #             else:
    #                 nop_count = random_nop_interval()  # Randomize the number of nop(s)
    #                 print('    nop\n' * nop_count)

