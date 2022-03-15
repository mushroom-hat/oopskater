import random
import re
from os import remove
from shutil import move

from urllib3.connectionpool import xrange


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

def random_nop_interval():  # Randomize the number of nop(s)
    return random.sample(xrange(3), 1)[0] + 1

VALID_OP_CODE = get_valid_op_code()

def add_nop_in_method(smali_file):
    """Add multiple nop sequence of random length (1-3) between two nop-valid instruction"""
    count = 0
    overwrite_flag = False

    try:
        """Generate new temp file to be accessed, due to multithreaded. It might access the same file name, therefore causing an error"""
        file_name_item = str(smali_file).split("\\")
        file_name = file_name_item.pop()
        file_name = "new_" + file_name
        file_name_item.append(file_name)
        file_name = "\\".join(file_name_item)

        with open(smali_file, 'r+') as in_file, open(file_name, 'w') as out_file:
            smali_content = in_file.readlines()
            for smali_line in smali_content:
                out_file.write(smali_line)
                try:
                    line_op_code = re.search(r'^([ ]*)(?P<opCode>([^ ]+)) ', smali_line)
                    if line_op_code is not None:
                        op_code = line_op_code.group('opCode')
                        if op_code in VALID_OP_CODE:
                            nop_count = random_nop_interval()  # Randomize the number of nop(s)
                            out_file.write('    nop\n' * nop_count)
                            overwrite_flag = True
                    count += 1
                except:
                    print("Error writing NOP to : " + file_name)
                    count += 1
                    pass

        if overwrite_flag:
            remove(smali_file)
            move(file_name, smali_file)
        else:
            remove(file_name)
        return 1
    except:
        return 0