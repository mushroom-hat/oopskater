import base64
import os
import re
import random
from timeit import default_timer as timer
# Change here
# TEST_FILE = r"C:\Users\tayzh\Documents\SIT\Year 1 Sem 2\ICT2207 Mobile Security\Project\Coursework1\ict2207-labP5-team4-2022-coursework\Coursework1\Project\app\src\main\java\com\singaporetech\audiorecorder\Exfiltration.java"
TIME = 0
import obfuscate_smali_files
# = r"C:\Users\tayzh\Documents\SIT\Year 1 Sem 2\ICT2207 Mobile Security\Project\Coursework2 (Working Dir)\test.java"
#FILEPATH = r"C:\Users\tayzh\Documents\SIT\Year 1 Sem 2\ICT2207 Mobile Security\Project\Coursework1\ict2207-labP5-team4-2022-coursework\Coursework1\Project\app\src\main\java\com\singaporetech\audiorecorder\Exfiltration.java"
VARIABLES_DICT = r"resources\\JAVA\\variables.dict"
#TEST_DIR = r"C:\\Users\\tayzh\\Documents\\SIT\\Year 1 Sem 2\\ICT2207 Mobile Security\\Project\\Coursework2 (Working Dir)\\Java_Test_Files\\"


# Takes in a java file as parameter, returns a dictionary that has line number as key and line as value.
# Each line is separate by \r\n
def readfile(filepath):
    f = open(filepath, "r")
    line_dict = {}
    line_number = 1
    for line in f.readlines():
        line_dict[line_number] = line
        line_number += 1
    return line_dict


RENAME_DICT = {}  ## this dictionary stores all the variables that were renamed and the renamed string
LIST_OF_SET_STRING = []


# get random string for renaming purposes
def get_random_string():
    f = open(VARIABLES_DICT, "r")
    random_numb = random.randint(0, 9999)
    random_list = f.readlines()
    random_str = random_list[random_numb].replace("\n", "")
    while random_str not in LIST_OF_SET_STRING:
        break
    return random_str


def change_key(line_dict):
    temp_dict = {}
    i = 1
    for key, value in line_dict.items():
        temp_dict[i] = line_dict[key]
        i += 1

    return temp_dict


# takes in a dictionary of lines and remove empty lines (i.e., new lines)
def remove_empty_lines(line_dict):

    for line_number, line in list(line_dict.items()):
        # remove spaces if there are two or more spaces
        line_dict[line_number] = re.sub(' +', ' ', line)

        if line == "\n":  # if line is an empty line, remove it from the dictionary
            del line_dict[line_number]

        # placement of statement might chance later
        if "@Override" in line and "\n" in line:
            line_dict[line_number] = line.replace("\n", "")

    return change_key(line_dict)


# takes in a dictionary of lines and remove comments
def remove_comments(line_dict):

    for line_number, line in list(line_dict.items()):

        #  remove multi-line comments
        if "/*" in line:
            if "*/" in line:  # try to find end of comment, if end of comment is in the same line, it is a bad line
                del line_dict[line_number]
            else:  # check next line(s) until */ is found
                del line_dict[line_number]
                next_line = line_number + 1
                while "*/" not in line_dict[next_line]:
                    del line_dict[next_line]
                    next_line += 1
                # at the end of this while loop, we will land on the line number with */
                del line_dict[next_line]

        #  remove single-line comments
        if "//" in line:
            line = line.split("//")[0]  # remove java comments
            if line.strip() == "":  # after removing comments, if line is empty string, it is a bad line
                del line_dict[line_number]

    return change_key(line_dict)


# takes in a dictionary of lines and remove empty spaces
def remove_spaces(line_dict):
    for line_number, line in list(line_dict.items()):
        # remove two or spaces in a line
        line = re.sub(' +', ' ', line)
        if "+" in line:
            line = line.replace(" + ", "+")
        if "=" in line:
            line = line.replace(" = ", "=")
        if ") " in line:
            line = line.replace(") ", ")")
        if "( " in line:
            line = line.replace("( ", "(")
        if " ) " in line:
            line = line.replace(" ) ", ")")
        if " ( " in line:
            line = line.replace(" ( ", "(")

        if ";\n" in line or "{\n" in line or "}\n" in line or ",\n" in line:
            line = line.replace('\n', "")  # remove end of line
        # if "\n" in line:
        #    line = line.replace("\n", " ")

        line_dict[line_number] = line

    return line_dict


def identify_java_methods(
        each_class):  # returns a list containing each functions i.e., [[function_1], [function_2], [function_3]]
    i = 1
    methods = []  # a list storing a list of each java functions
    temp = []
    class_name = each_class[0]
    class_declarations = []
    # identify the methods for each class
    while i != len(each_class):
        java_fn = []
        line = each_class[i]
        line_number = i
        number_of_function_lines = 0
        number_of_start_brackets = 0  # {
        number_of_end_brackets = 0  # }
        # check if line is the start of function
        if ("public" in line or "private" in line) and ("{" in line or "{" in each_class[line_number + 1]) and ";" not in line:  # start of function
            next_line_number = line_number + 1
            if temp:
                for l in temp:
                    java_fn.append(l)
            java_fn.append(line)
            if "{" in line:
                number_of_start_brackets += 1

            number_of_function_lines += 1

            if "{" in each_class[next_line_number]:  # if "}" in next line, skip the line
                java_fn.append(each_class[next_line_number])
                next_line_number += 1
                number_of_start_brackets += 1
                number_of_function_lines += 1

            # while next line is not a "start-of-function" line, increment the number of function lines and append the line to its function.
            while next_line_number != len(each_class) and number_of_end_brackets != number_of_start_brackets:
                next_line = each_class[next_line_number]
                java_fn.append(next_line)

                if "{" in next_line:
                    number_of_start_brackets += 1
                if "}" in next_line:
                    number_of_end_brackets += 1
                number_of_function_lines += 1
                next_line_number += 1
            temp.clear()
            methods.append(java_fn)
            i += number_of_function_lines

        else:
            if ("public" in line or "private" in line) and ";" in line:  # start of function
                class_declarations.append(line)
            elif "}" not in line:
                temp.append(line)
            i += 1

    methods[-1].append(" }\n")
    return methods, class_name, class_declarations


# takes in a java source code and dissect it into the Java Structure. We are following the standard java structure for each file
# 1) Package Statement
# 2) Import Statement
# 3) Interface Statement
# 4) Class Definition
# - Inside each class, there might be other methods such as main()
def dissect_code(line_dict):
    package_statement = line_dict[1]  # first line is package statement
    import_statements = []
    interface_statements = []
    class_definitions = []
    number_of_class_lines = 0
    number_of_start_brackets = 0  # {
    number_of_end_brackets = 0  # }
    i = 1
    while i < len(line_dict):
        line_number = i
        each_class = []
        line = line_dict[line_number]
        if "import" in line:
            import_statements.append(line)

        # identify classes in the same file
        if " class " in line or " class " in line:
            each_class.append(line)
            next_line = line_number + 1
            number_of_class_lines += 1
            if "{" in line:  # if "}" in next line, skip the line
                number_of_start_brackets += 1

            if "{" in line_dict[next_line]:
                each_class.append(line_dict[next_line])
                next_line += 1
                number_of_start_brackets += 1
                number_of_class_lines += 1

            while next_line != len(line_dict) and number_of_end_brackets != number_of_start_brackets:
                if "{" in line_dict[next_line]:
                    number_of_start_brackets += 1
                if "}" in line_dict[next_line]:
                    number_of_end_brackets += 1
                each_class.append(line_dict[next_line])
                next_line += 1
                number_of_class_lines += 1
            class_definitions.append(each_class)
            i += number_of_class_lines

        else:
            i += 1
    return package_statement, import_statements, interface_statements, class_definitions


def write_to_file(line_dict, output_file_dir, output_file):
    obfus_code = []
    print("writing to {}".format(output_file_dir + "\\" + output_file))
    write_f = open(output_file_dir + "\\" + output_file, "w")
    for line_number, line in line_dict.items():
        write_f.write(line)

    write_f.close()

# populate a global dictionary with pre-obfuscated variable name and obfuscated string
def generate_obfuscated_variables(method):
    global LIST_OF_SET_STRING
    variable_types = ["String", "byte", "byte[]", "int", "float", "char", "boolean", "File"]
    for line in method:
        match = re.search(r'([a-zA-Z0-9_\[\]]+) ([a-zA-Z0-9_]+) =', line)
        if match:
            variable = match.group()
            variable_split = re.split(' ', variable)
            for var_type in variable_types:
                if variable_split[0] == var_type:
                    if variable_split[1] not in RENAME_DICT and variable_split[1] not in LIST_OF_SET_STRING:
                        random_string = get_random_string()  # random variable name
                        RENAME_DICT[variable_split[1]] = random_string
                        LIST_OF_SET_STRING.append(random_string)


# def rename_method_name(method):
#     method_line = method[0]
#     if "@Override" in method_line:  # don't replace method name if it is overwritten from somewhere else i.e., interfaces
#     methodname = re.search(r'(?:(?:public)|(?:private)|(?:static)|(?:protected)\s+)*', method_line)
#     print(methodname)
#     #method_line = method_line.replace(methodname, random_obfuscated_string)
#
#     return 0

# obfuscate each method in a class, returns a class

# def check_full_text(original_text, variable, new_text):
#     import string
#
#     az_Upper = list(string.ascii_uppercase)
#     az_Lower = list(string.ascii_lowercase)
#     az_Symbol = list("; ()[].$%^")
#     list_text = list(original_text)
#     list_variable = list(variable)
#
#     count = 0
#     while True:
#         temp_list = []
#         if count == len(list_text):
#             break
#
#         temp_count = count
#         for char in list_variable:
#             if list_text[temp_count] != char:
#                 break
#             else:
#                 temp_list.append(list_text[temp_count])
#                 temp_count += 1
#
#         if list_text[temp_count] not in az_Upper and list_text[temp_count] in az_Symbol and temp_list == list_variable\
#                 :
#             try:
#                 print(list_text[temp_count-1])
#                 print(temp_list)
#                 if new_text == "" and list_text[temp_count-1] == 'm':
#                     new_text += original_text[0:count+1]
#                 else:
#                     new_text += original_text[0:count] + RENAME_DICT[variable]
#                 print("temp_name",original_text[0:count] + RENAME_DICT[variable] + original_text[count+len(variable):])
#
#                 # new_text += original_text[0:count+1]
#                 original_text = original_text[count + len(variable) + 1:]
#                 print("New Text: ", new_text)
#                 print("Original Text: ",original_text)
#                 print("\n")
#                 return check_full_text(original_text, variable, new_text)
#             except IndexError:
#                 pass
#         count += 1
#     return new_text + original_text

# function to check if the same line contains both a quoted string and a variable that can be obfuscated
def replace_quoted_words(line, count, list_of_quoted_words):
    if count == 0:
        new_line = line

        for variable_name, obfuscated_string in RENAME_DICT.items():
            pattern = ' ' + variable_name + ' '
            match1 = re.search(pattern, new_line)
            if match1:
                new_line = re.sub(pattern, " " + obfuscated_string + " ", new_line)

            pattern = '[^a-zA-Z0-9]' + variable_name + '[^a-zA-Z0-9]'
            match = re.search(pattern, new_line)
            if match:
                start = match.group(0)[0]
                end = match.group(0)[-1]
                new_line = re.sub(pattern, start + obfuscated_string + end, new_line)

            pattern = '[^a-zA-Z0-9 ]' + variable_name + " "
            match3 = re.search(pattern, new_line)
            if match3:
                start = match3.group(0)[0]
                end = match3.group(0)[-1]
                new_line = re.sub(pattern, start + obfuscated_string + end, new_line)
                # print(temp + " <====> " + line)

            # obs_string = obfuscate_readable_strings(quoted_word) <- gena here
            # encode the quoted word
            # encoded_string = encode_string(quoted_word)
            # replace TEMP STRING with original quote word
        for i in range(len(list_of_quoted_words)):
            new_line = new_line.replace("TEMPCHAR_FOR_QUOTED_PATTERN{}".format(i), list_of_quoted_words[i])
        return new_line

    quoted_word = r''
    quote_pattern = '"(.*?)"'
    for i in range(len(line)):
        s = i
        if line[i] == '"':
            quoted_word += '"'
            while s <= len(line):
                if line[s + 1] == '"':
                    quoted_word += '"'
                    break
                quoted_word += line[s + 1]
                s += 1
            break

    new_line = line.replace(quoted_word, "TEMPCHAR_FOR_QUOTED_PATTERN{}".format(len(list_of_quoted_words)))
    list_of_quoted_words.append(quoted_word)

    new_line = replace_quoted_words(new_line, count - 1, list_of_quoted_words)
    return new_line


def rename_variables(methods):
    # obfuscate using that dictionary
    obfuscated_methods = []
    for each_method in methods:
        line_counter = 0
        for line in each_method:
            quote_pattern = '"(.*?)"'
            quote_match_list = re.findall(quote_pattern, line)
            if not quote_match_list:  # if there are no quotes in the line, just obfuscate normally
                for variable_name, obfuscated_string in RENAME_DICT.items():
                    pattern = ' ' + variable_name + ' '
                    match1 = re.search(pattern, line)
                    if match1:
                        line = re.sub(pattern, " " + obfuscated_string + " ", line)
                        each_method[line_counter] = line

                    pattern = '[^a-zA-Z0-9]' + variable_name + '[^a-zA-Z0-9 ]'
                    match2 = re.search(pattern, line)

                    if match2:
                        start = match2.group(0)[0]
                        end = match2.group(0)[-1]
                        line = re.sub(pattern, start + obfuscated_string + end, line)
                        each_method[line_counter] = line

                    pattern = '[^a-zA-Z0-9 ]' + variable_name + " "
                    match3 = re.search(pattern, line)
                    if match3:
                        start = match3.group(0)[0]
                        end = match3.group(0)[-1]
                        line = re.sub(pattern, start + obfuscated_string + end, line)
                        # print(temp + " <====> " + line)
                        each_method[line_counter] = line

            else:  # if there is a quote match, handle it differently
                if quote_match_list:
                    each_method[line_counter] = replace_quoted_words(line, len(quote_match_list), [])

            line_counter += 1
        obfuscated_methods.append(each_method)
    return obfuscated_methods


def rename_method(methods, class_name):
    class_index = class_name.split().count("class")
    class_name = class_name.split()[class_index + 1]
    OVERRIDE = False
    for each_method in methods:
        for line in each_method:
            if "@Override" in line:
                OVERRIDE = True

        if not OVERRIDE:
            line_number = 0
            for line in each_method:
                if ("public" in line or "private" in line) and ("{" in line or "{" in each_method[line_number + 1]) and ";" not in line and " class " not in line:  # start of function
                    pattern = '[ ][a-zA-Z0-9_]+\\((.*?)\\)[ $]'
                    search = re.search(pattern, line)
                    if search:
                        method_name = search.group(0)
                        method_split = method_name.split("(")
                        m = method_split[0].strip(" ")
                        m_rest = ""
                        if m != "main" and m != class_name:
                            for split in method_split[1:]:
                                m_rest += split
                            random_str = get_random_string()
                            RENAME_DICT[m + "()"] = random_str
                            LIST_OF_SET_STRING.append(random_str)

                            obfuscated_method_name = " " + random_str + "(" + m_rest
                            each_method[line_number] = line.replace(method_name, obfuscated_method_name)
                    break

                line_number += 1
        OVERRIDE = False
    return methods

# function to obfuscate numeric values in the file
def obfuscate_numeric(methods):
    for each_method in methods:
        random_str1 = get_random_string()
        random_str2 = get_random_string()
        line_counter = 0
        match = False
        for line in each_method:
            numeric_pattern = r' ([0-9_]+);'
            match_list = re.findall(numeric_pattern, line)
            if match_list:
                match = True
                for each_match in match_list:
                    obfuscated_num = (' ({}*{} + ' + str(int((int(each_match) / 2))) + '*{} - 2*{});').format(
                        random_str1, random_str2, random_str1, random_str2)
                    each_method[line_counter] = re.sub(numeric_pattern, obfuscated_num, line)
            line_counter += 1

        if match:
            index = 0
            for line in each_method:
                # after first occurrence of {, add the variable
                if "{" in line:
                    each_method.insert(index + 1, "int {} = (int) '{}';\n".format(random_str1, chr(2)))
                    each_method.insert(index + 2, "int {} = (int) '{}';\n".format(random_str2, chr(3)))
                    break
                index += 1
        # add the random variable

    return methods


# function to encode strings inside each method
def encode_string(quoted_string):
    random_numb = random.randint(1, 9)
    string_in_bytes = quoted_string.encode("ascii")
    base64_bytes = base64.b64encode(string_in_bytes)

    # encode a random number of times
    for i in range(random_numb):
        base64_bytes = base64.b64encode(base64_bytes)

    base64_string = base64_bytes.decode("ascii")
    print(base64_string)

    ## DECRYPT SECTION
    base64_bytes = base64_string.encode('ascii')
    message_bytes = base64.b64decode(base64_bytes)

    for i in range(random_numb):
        message_bytes = base64.b64decode(message_bytes)
    message = message_bytes.decode('ascii')
    print(message)

    return str(random_numb) + base64_string


def overload_method(methods):
    overloaded_methods = []
    methods_to_overload = {}
    number_of_methods_to_overload = int(len(methods)/3)  # overload a third of methods
    for i in range(number_of_methods_to_overload):
        while True:
            random_number = random.randint(1, number_of_methods_to_overload)
            if random_number + 1 not in methods_to_overload:
                methods_to_overload[random_number + 1] = methods[random_number].copy()
                break

    for index, each_method in list(methods_to_overload.items()):
        for line in each_method:
            if "@Override" in line:
                del methods_to_overload[index]
                break

    for index, each_method in methods_to_overload.items():
        new_method = []
        line_number = 0
        METHOD_ADDED = False
        for line in each_method:
            if ("public" in line or "private" in line) and ("{" in line or "{" in each_method[line_number + 1]) and ";" not in line and " class " not in line and not METHOD_ADDED:  # start of function
                pattern = '[ ][a-zA-Z0-9_]+\\((.*?)\\)[ $]'
                search = re.search(pattern, line)
                type = ["String", "float", "byte", "int"]
                rand = random.randint(0, len(type) - 1)
                random_variable_to_add = ", " + type[rand] + " " + get_random_string()
                if search:
                    method_name = search.group(0)
                    if method_name[-3] == "(":
                        random_variable_to_add = type[rand] + " " + get_random_string()
                    new_method_name = method_name[:-2] + random_variable_to_add
                    new_method.append(line.replace(method_name[:-2], new_method_name))
                    new_method = ''.join(new_method)
                    # change return type
                    new_method = new_method.split()
                    temp = ""
                    for i in range(len(new_method)):
                        if new_method[i] == "static":
                            new_method[i + 1] = "String"
                        temp += new_method[i] + " "
                    if "{" in each_method[line_number + 1]:
                        temp += "{" + " "
                    print([temp])
                    new_method = [temp]
                    METHOD_ADDED = True

            line_number += 1
        global TIME
        start = timer()

        new_methods = insert_opaque_predicates(new_method)
        end = timer()
        TIME += end - start
        for method in new_methods:
            methods.insert(index, method)
    return methods


# public static double genRan(int cnt) {int m = (int)Math.pow(10, cnt - 1);return cir(m);}
#
# public static double cir(double m) {m = m * 3.142; return m;}
#
# public static void main() {if (genRan(5) == cir(5)) {int genRanAway=1;}}

# in a list of methods, insert opaque predicates
def insert_opaque_predicates(method):
    list_of_injected_methods = []
    variable_types = ["String", "byte", "byte[]", "int", "float", "char", "boolean", "File"]
    match = re.search(r'[ ][a-zA-Z0-9_]+\((.*?)\)[ $]', method[0])
    variable = ""
    if match:
        variable = match.group()
        temp = ""
        for i in range(len(variable)):
            if variable[i] == "(":
                s = i
                while variable[s] != ")":
                    if variable[s] != "(":
                        temp += variable[s]
                    s += 1

        if temp.split(","):
            variable = temp.split(",")[0]
            variable = variable.split()[1]

        predicate = "int genRanAway = 5;if (genRan(5) == cir(5)) { genRanAway = 1; } return String.valueOf(genRanAway) + String.valueOf(" + variable + "); }\n"
    else:
        predicate = "int genRanAway = 5;if (genRan(5) == cir(5)) { genRanAway = 1; } return String.valueOf(genRanAway); }\n"

    method_1 = ["public static double genRan(int cnt) {int m = (int)Math.pow(10, cnt - 1);return cir(m);}\n"]
    method_2 = ["public static double cir(double m) {m = m * 3.142; return m;}\n"]
    method.append(predicate)
    list_of_injected_methods.append(method_1)
    list_of_injected_methods.append(method_2)
    list_of_injected_methods.append(method)

    return list_of_injected_methods

def obfuscate(directory_path):
    # loop through each java file, obfuscate it and return a obfuscated java file
    list_of_clean_java_files = []
    list_of_obfuscated_java_files = []

    print("111")
    for filename in os.listdir(directory_path):
        list_of_clean_java_files.append(directory_path + "\\" + filename)
    obfuscate_smali_files.backup_files(list_of_clean_java_files)

    for abs_filename in os.listdir(directory_path):
        if "obfuscated" not in abs_filename:
            line_dict = readfile(directory_path + "\\" + abs_filename)

            #  dissecting java files into smaller functions for easier obfuscation
            # java_classes = identify_java_classes(line_dict)

            # DATA OBFUSCATION -------------------

            # DESIGN OBFUSCATION -----------------

            # LAYOUT OBFUSCATION -----------------
            line_dict = remove_comments(line_dict)
            line_dict = remove_empty_lines(line_dict)
            package_statement, import_statements, interface_statements, class_definitions = dissect_code(line_dict)
            obfuscated_classes = []
            for each_class in class_definitions:
                java_methods, class_name, class_declarations = identify_java_methods(each_class)  # returns a list of methods in each class
                for each_method in java_methods:
                    generate_obfuscated_variables(each_method)  # use each method to generate obfuscated variables

                java_methods = rename_method(java_methods, class_name)
                java_methods = rename_variables(java_methods)

                java_methods = obfuscate_numeric(java_methods)

                java_methods = overload_method(java_methods)
                class_declarations.insert(0, class_name)
                for i in range(len(class_declarations)):
                    # after obfuscating methods, add back the class name
                    java_methods[0].insert(i, class_declarations[i])

                obfuscated_classes += java_methods


            # CONTROL FLOW OBFUSCATION ------------
            # repackage into an apk
            line_dict = repackage(package_statement, set(import_statements), interface_statements, obfuscated_classes)
            # line_dict = remove_spaces(line_dict)

            filename = abs_filename.split("\\")[-1]
            #output_filename = "obfuscated_" + filename
            output_filename = filename
            new_directory_path = r"diffviewer\\new\\"
            write_to_file(line_dict, new_directory_path, output_filename)
            #list_of_obfuscated_java_files.append(directory_path + "\\" + output_filename)
            #  write_to_file(code)
    print("Average time taken to add opaque predicates")
    print("to injected methods in all supplied files: {}".format(TIME/7))
    #obfuscate_smali_files.generate_new_files(list_of_obfuscated_java_files)


# write all relevant lines into a dictionary for further writing to a file.
def repackage(package_statement, import_statements, interface_statements, obfuscated_classes):
    line_dict = {1: package_statement}
    line_number = 2  # start from line 2 as line 1 is occupied by package statement

    for imp in import_statements:
        line_dict[line_number] = imp
        line_number += 1

    for interface in interface_statements:
        line_dict[line_number] = interface
        line_number += 1

    for each_class in obfuscated_classes:
        for line in each_class:
            line_dict[line_number] = line
            line_number += 1
        header_class = True


    return line_dict


#obfuscate(TEST_DIR, TEST_DIR)
