import re
import hashlib

def md5_data(file_data, is_string=False):
    if is_string:
        file_data = file_data.encode('utf-8')
    return hashlib.md5.new(file_data)

def crypt_identifier(param_value):
    return 'a' + md5_data(param_value).hexdigest().lower()[:8]


def get_match_line(smali_line, android_method_list, is_rename):
    """Rename a method definition"""
    method_match = re.search(r'^([ ]*?)\.method(.*?) (?P<invokeMethod>([^ ]*?))\((?P<invokePass>(.*?))\)(?P<invokeReturn>(.*?))$', smali_line)  # Match a method definition
    if method_match is None:
        return None  # Return None
    method_name = method_match.group('invokeMethod')  # Recover the method name
    if method_name not in android_method_list:  # For non SDK method
        if is_rename:
            smali_line.replace(method_name + '(', crypt_identifier(method_name) + '(')
        return method_name  # Return the method name
    else:
        return None  # Return None

def find_all_native_method(smali_file_list):
    """Search for a method definition in all the smali file"""
    for smali_file in smali_file_list:  # For each file

        with open(smali_file,'r+') as file:
            smali_line = file.readline()
            if re.search(r'^([ ]*?)\.method', smali_line) is not None and re.search(r' native ',
                                                                                    smali_line) is not None:
                print("Found")
                method_name = get_match_line(smali_line, [], False)
                if method_name is not None:
                    print(method_name)


        # for smali_line in u.open_file_input(smali_file):  # For each line
        #
        #         method_name = get_match_line(smali_line, [], False)
        #         if method_name is not None:
        #             return method_name  # Return the method name


def main():
    with open("file_list.txt",'r') as file:
        content = file.readlines()
        filtered_file_list = []
        for file in content:
            filtered_file_list.append(file.replace('\n',''))
        find_all_native_method(filtered_file_list)

main()