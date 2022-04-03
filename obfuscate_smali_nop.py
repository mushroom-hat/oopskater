import random
import re
from os import remove
from shutil import move
import util

from urllib3.connectionpool import xrange


def get_text_file(file_name):
    """ This function will get a text from the file given. """
    try:
        with open(file_name) as file_list:
            return file_list.read()
    except IOError as e:
        raise e.LoadFileException(str(e) + '\nUnable to load ' + file_name)


def get_text_as_list(file_name):
    """ Get a text file as line-per-line list """
    return get_text_file(file_name).splitlines()


def get_valid_op_code():
    return get_text_as_list('resources/NOPValidOpCode.txt')


def random_nop_interval():
    """ Generate a random number of nop statements """
    return random.sample(xrange(5), 1)[0] + 1


def add_nop_algorithm(smali_file):
    """Add multiple nop sequence of random length (1-3) between two nop-valid instruction"""
    count = 0
    op_codes = get_valid_op_code()
    pattern = re.compile(r"\s+(?P<op_code>\S+)")
    try:

        with util.edit_file_content(smali_file) as (in_file, out_file):
            for line in in_file:
                out_file.write(line)
                match = pattern.match(line)
                if match:
                    op_code = match.group("op_code")
                    if op_code in op_codes:
                        nop_count = random_nop_interval()
                        out_file.write("\tnop\n" * nop_count)
                        count += nop_count
        return count
    except:
        return 0
