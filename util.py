from contextlib import contextmanager
from hashlib import md5
from tqdm import tqdm
import itertools
import os
import random
import string




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
            "Overloaded_body.smali.txt",
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


def get_android_class_names():
    return set(get_non_empty_lines_from_file(
        os.path.join(
            os.path.dirname(__file__), "resources", "Android_class_names.txt"
        )
    ))

def get_api_reflection_smali_code():
    return get_text_from_file(
        os.path.join(
            os.path.dirname(__file__), "resources", "ApiReflection.smali.txt"
        )
    )