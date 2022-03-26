import itertools
import logging
import os
import random
import re
import string
from hashlib import md5


from tqdm import tqdm

########################################################################################
#                                Common regex patterns.                                #
########################################################################################
from contextlib import contextmanager

LOCALS_PATTERN = re.compile(r"\s+\.locals\s(?P<local_count>\d+)")
# .class <other_optional_stuff> <class_name;>  # Every class name ends with ;
CLASS_PATTEN = re.compile(r"\.class.+?(?P<class_name>\S+?;)", re.UNICODE)
# L<class_name>;  # Every class name starts with L and ends with ;
CLASS_NAME_PATTEN = re.compile(r"L[^():\s]+?;", re.UNICODE)
# .method <other_optional_stuff> <method_name>(<param>)<return_type>

METHOD_PATTEN = re.compile(
    r"\.method.+?(?P<method_name>\S+?)"
    r"\((?P<method_param>\S*?)\)"
    r"(?P<method_return>\S+)",
    re.UNICODE,
)

# .field <other_optional_stuff> <field_name>:<field_type> <optional_initialization>
FIELD_PATTERN = re.compile(
    r"\.field.+?(?P<field_name>\S+?):" r"(?P<field_type>\S+)", re.UNICODE
)

def get_string_md5(input_string: str) -> str:
    return md5(input_string.encode()).hexdigest()


@contextmanager
def inplace_edit_file(file_name: str):
    """
    Allow for a file to be replaced with new content.
    Yield a tuple of (readable, writable) file objects, where writable replaces
    readable. If an exception occurs, the old file is restored, removing the
    written data.
    """

    backup_file_name = "{0}{1}{2}".format(file_name, os.extsep, "bak")

    try:
        os.unlink(backup_file_name)
    except OSError:
        pass
    os.rename(file_name, backup_file_name)

    readable = open(backup_file_name, "r", encoding="utf-8")
    try:
        perm = os.fstat(readable.fileno()).st_mode
    except OSError:
        writable = open(file_name, "w", encoding="utf-8", newline="")
    else:
        os_mode = os.O_CREAT | os.O_WRONLY | os.O_TRUNC
        if hasattr(os, "O_BINARY"):
            os_mode |= os.O_BINARY
        fd = os.open(file_name, os_mode, perm)
        writable = open(fd, "w", encoding="utf-8", newline="")
        try:
            if hasattr(os, "chmod"):
                os.chmod(file_name, perm)
        except OSError:
            pass
    try:
        yield readable, writable
    except Exception as e:
        try:
            os.unlink(file_name)
        except OSError:
            pass
        os.rename(backup_file_name, file_name)
    finally:
        readable.close()
        writable.close()
        try:
            os.unlink(backup_file_name)
        except OSError:
            pass

# When iterating over list L, "for element in show_list_progress(L, interactive=True)"
# will show a progress bar. When setting "interactive=False", no progress bar will be
# shown. While using this method, no other code should write to standard output.
def show_list_progress(the_list: list,interactive: bool = False,unit: str = "file",description: str = None):
    if not interactive:
        return the_list
    else:
        return tqdm(
            the_list,
            dynamic_ncols=True,
            unit=unit,
            desc=description,
            bar_format="{l_bar}{bar}|[{elapsed}<{remaining}, {rate_fmt}]",
        )

def get_smali_method_overload():
    return get_text_from_file(
        os.path.join(
            os.path.dirname(__file__),
            "resources",
            "overloaded_method_body.smali.txt",
        )
    )

def get_text_from_file(file_name: str):
    try:
        with open(file_name, "r", encoding="utf-8") as file:
            return file.read()
    except Exception as e:
            print('Error during reading file "{0}": {1}'.format(file_name, e))

def get_random_list_permutations(input_list: list):
    permuted_list = list(itertools.permutations(input_list))
    random.shuffle(permuted_list)
    return permuted_list

def get_non_empty_lines_from_file(file_name: str):
    try:
        with open(file_name, "r", encoding="utf-8") as file:
            # Return a list with the non-blank lines contained in the file.
            return list(filter(None, (line.rstrip() for line in file)))
    except Exception as e:
        print('Error during reading file "{0}": {1}'.format(file_name, e))


def get_random_string(length: int):
    return "".join(random.choices(string.ascii_letters, k=length))

def get_random_int(min_int: int, max_int: int):
    return random.randint(min_int, max_int)


# <spaces> <usage_type> <param>, <field_object>-><field_name>:<field_type>
FIELD_USAGE_PATTEN = re.compile(
    r"\s+(?P<usage_type>[is](get|put)\S*)\s"
    r"(?P<field_param>[vp0-9,\s]+),\s"
    r"(?P<field_object>\S+?)"
    r"->(?P<field_name>\S+?):"
    r"(?P<field_type>\S+)",
    re.UNICODE,
)

TYPE_DICT = {
            "I": "Ljava/lang/Integer;",
            "Z": "Ljava/lang/Boolean;",
            "B": "Ljava/lang/Byte;",
            "S": "Ljava/lang/Short;",
            "J": "Ljava/lang/Long;",
            "F": "Ljava/lang/Float;",
            "D": "Ljava/lang/Double;",
            "C": "Ljava/lang/Character;",
        }

SGET_DICT = {
            "I": "Ljava/lang/Integer;->TYPE:Ljava/lang/Class;",
            "Z": "Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;",
            "B": "Ljava/lang/Byte;->TYPE:Ljava/lang/Class;",
            "S": "Ljava/lang/Short;->TYPE:Ljava/lang/Class;",
            "J": "Ljava/lang/Long;->TYPE:Ljava/lang/Class;",
            "F": "Ljava/lang/Float;->TYPE:Ljava/lang/Class;",
            "D": "Ljava/lang/Double;->TYPE:Ljava/lang/Class;",
            "C": "Ljava/lang/Character;->TYPE:Ljava/lang/Class;",
        }

CAST_DICT = {
            "I": "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;",
            "Z": "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;",
            "B": "Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;",
            "S": "Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;",
            "J": "Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;",
            "F": "Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;",
            "D": "Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;",
            "C": "Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;",
        }

REVERSE_CAST_DICT = {
            "I": "Ljava/lang/Integer;->intValue()I", "Z": "Ljava/lang/Boolean;->booleanValue()Z",
            "B": "Ljava/lang/Byte;->byteValue()B", "S": "Ljava/lang/Short;->shortValue()S",
            "J": "Ljava/lang/Long;->longValue()J", "F": "Ljava/lang/Float;->floatValue()F",
            "D": "Ljava/lang/Double;->doubleValue()D", "C": "Ljava/lang/Character;->charValue()C",
        }


# <spaces> invoke-<type> {<passed_param>}, <class_name>-><method>(<param>)<return_type>
INVOKE_PATTERN = re.compile(
    r"\s+(?P<invoke_type>invoke-\S+)\s"
    r"{(?P<invoke_pass>[vp0-9,.\s]*)},\s"
    r"(?P<invoke_object>\S+?)"
    r"->(?P<invoke_method>\S+?)"
    r"\((?P<invoke_param>\S*?)\)"
    r"(?P<invoke_return>\S+)",
    re.UNICODE,
)

def get_android_class_names():
    return set(get_non_empty_lines_from_file(
        os.path.join(
            os.path.dirname(__file__), "resources", "android_class_names_api.txt"
        )
    ))

def get_api_reflection_smali_code():
    return get_text_from_file(
        os.path.join(
            os.path.dirname(__file__), "resources", "ApiReflection.smali.txt"
        )
    )