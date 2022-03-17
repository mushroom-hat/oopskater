import os
import re
import random

# Change here
# TEST_FILE = r"C:\Users\tayzh\Documents\SIT\Year 1 Sem 2\ICT2207 Mobile Security\Project\Coursework1\ict2207-labP5-team4-2022-coursework\Coursework1\Project\app\src\main\java\com\singaporetech\audiorecorder\Exfiltration.java"
OBFUS_TESTFILE = r"C:\Users\tayzh\Documents\SIT\Year 1 Sem 2\ICT2207 Mobile Security\Project\Coursework2 (Working Dir)\test.java"
FILEPATH = r"C:\Users\tayzh\Documents\SIT\Year 1 Sem 2\ICT2207 Mobile Security\Project\Coursework1\ict2207-labP5-team4-2022-coursework\Coursework1\Project\app\src\main\java\com\singaporetech\audiorecorder\Exfiltration.java"
VARIABLES_DICT = r"C:\Users\tayzh\Documents\SIT\Year 1 Sem 2\ICT2207 Mobile Security\Project\Coursework2 (Working Dir)\variables.dict"
TEST_DIR = r"C:\\Users\\tayzh\\Documents\\SIT\\Year 1 Sem 2\\ICT2207 Mobile Security\\Project\\Coursework2 (Working Dir)\\Java_Test_Files\\"

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
        #if "\n" in line:
        #    line = line.replace("\n", " ")

        line_dict[line_number] = line

    return line_dict

def identify_java_methods(each_class):  # returns a list containing each functions i.e., [[function_1], [function_2], [function_3]]
    i = 0
    methods = []  # a list storing a list of each java functions
    temp = []
    # identify the methods for each class
    while i != len(each_class):
        java_fn = []
        line = each_class[i]
        line_number = i
        number_of_function_lines = 0
        number_of_start_brackets = 0  # {
        number_of_end_brackets = 0  # }
        # check if line is the start of function
        if ("public" in line or "private" in line) and ("{" in line or "{" in each_class[line_number + 1]) and ";" not in line and " class " not in line:  # start of function
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
            if "}" not in line:
                temp.append(line)
            i += 1
    methods[-1].append(" }\n")
    return methods



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
    each_class = []
    for line_number, line in line_dict.items():
        if "import" in line:
            import_statements.append(line)

        # identify classes in the same file
        if " class " in line or " class " in line:
            each_class.append(line)
            next_line = line_number + 1
            while next_line <= len(line_dict) and (" class " not in line_dict[next_line] or " class " not in line_dict[next_line]):
                each_class.append(line_dict[next_line])
                next_line += 1

            class_definitions.append(each_class)

    return package_statement, import_statements, interface_statements, class_definitions

def write_to_file(line_dict, output_file):
    obfus_code = []
    write_f = open(output_file, "w")

    for line_number, line in line_dict.items():
        write_f.write(line)


# takes in a list of java functions and change variables in each function
# NOT DONE
def rename_variables(method):
    global LIST_OF_SET_STRING
    variable_types = ["String", "byte", "byte[]", "int", "float", "char", "boolean", "File"]
    for line in method:
        match = re.search(r'([a-zA-Z0-9_\[\]]+) ([a-zA-Z0-9_]+) =', line)
        if match:
            variable = match.group()
            variable_split = re.split(' ', variable)
            for var_type in variable_types:
                if variable_split[0] == var_type:
                    if variable_split[1] not in RENAME_DICT:
                        while True:
                            random_string = get_random_string()  # random variable name
                            if random_string not in LIST_OF_SET_STRING:
                                break
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
def obfuscate(java_methods):
    obfuscated_methods = []
    for each_method in java_methods:
        #each_method = rename_method_name(each_method)
        rename_variables(each_method)  # populate a global dictionary with pre-obfuscated variable name and obfuscated string
        obfuscated_methods = obfuscated_methods + each_method
    return obfuscated_methods


def check_full_text(original_text, variable, new_text):
    import string

    az_Upper = list(string.ascii_uppercase)
    az_Lower = list(string.ascii_lowercase)
    az_Symbol = list("; ()[].$%^")
    list_text = list(original_text)
    list_variable = list(variable)

    count = 0
    while True:
        temp_list = []
        if count == len(list_text):
            break

        temp_count = count
        for char in list_variable:
            if list_text[temp_count] != char:
                break
            else:
                temp_list.append(list_text[temp_count])
                temp_count += 1

        if list_text[temp_count] not in az_Upper and list_text[temp_count] in az_Symbol and temp_list == list_variable\
                :
            try:
                print(list_text[temp_count-1])
                print(temp_list)
                if new_text == "" and list_text[temp_count-1] == 'm':
                    new_text += original_text[0:count+1]
                else:
                    new_text += original_text[0:count] + RENAME_DICT[variable]
                print("temp_name",original_text[0:count] + RENAME_DICT[variable] + original_text[count+len(variable):])

                # new_text += original_text[0:count+1]
                original_text = original_text[count + len(variable) + 1:]
                print("New Text: ", new_text)
                print("Original Text: ",original_text)
                print("\n")
                return check_full_text(original_text, variable, new_text)
            except IndexError:
                pass
        count += 1
    return new_text + original_text


def check_again2(line, variable):
    quoted_word = r''
    quote_pattern = '"(.*?)"'
    pattern = '[^a-zA-Z0-9]' + variable + '[^a-zA-Z0-9 ]'
    for i in range(len(line)):
        s = i
        if line[i] == '"':
            quoted_word += '"'
            while s <= len(line):
                if line[s+1] == '"':
                    quoted_word += '"'
                    break
                quoted_word += line[s+1]
                s += 1
            break

    line = re.sub(quote_pattern, "TEMPCHAR_FOR_QUOTED_PATTERN", line)
    match = re.search(pattern, line)
    if match:
        start = match.group(0)[0]
        end = match.group(0)[-1]
        line = re.sub(pattern, start+RENAME_DICT[variable]+end, line)
    # replace TEMP STRING with original quote word
    new_line = line.replace("TEMPCHAR_FOR_QUOTED_PATTERN", quoted_word)
    return new_line

def rename(java_methods):
    # obfuscate using that dictionary
    obfuscated_methods = []
    for each_method in java_methods:
        line_counter = 0
        for line in each_method:
            for variable_name, obfuscated_string in RENAME_DICT.items():
                quote_pattern = '"(.*?)"'
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
                    quote_match = re.search(quote_pattern, line)
                    if quote_match:
                        each_method[line_counter] = check_again2(line, variable_name)
                    else:
                        line = re.sub(pattern, start + obfuscated_string + end, line)
                        each_method[line_counter] = line

                pattern = '[^a-zA-Z0-9 ]' + variable_name + " "
                match3 = re.search(pattern, line)
                if match3:
                    temp = line
                    start = match3.group(0)[0]
                    end = match3.group(0)[-1]
                    line = re.sub(pattern, start + obfuscated_string + end, line)
                    # print(temp + " <====> " + line)
                    each_method[line_counter] = line


            line_counter += 1
        obfuscated_methods.append(each_method)

    return obfuscated_methods


def main():
    modified_package_statement = ""

    for filename in os.listdir(TEST_DIR):
        line_dict = readfile(TEST_DIR + filename)
        code = []

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
            print(each_class)
            java_methods = identify_java_methods(each_class)
            obfuscated_classes.append(obfuscate(java_methods))

        obfuscated_classes = rename(obfuscated_classes)

        # CONTROL FLOW OBFUSCATION ------------
        # repackage into an apk
        line_dict = repackage(modified_package_statement, set(import_statements), interface_statements, obfuscated_classes)
        #line_dict = remove_spaces(line_dict)

        output_filename = "obfuscated_" + filename
        write_to_file(line_dict, output_filename)
        #  write_to_file(code)

# write all relevant lines into a dictionary for further writing to a file.
def repackage(package_statement, import_statements, interface_statements, obfuscated_classes):
    line_dict = {1: package_statement}
    line_number = 2  # start from line 2 as line 1 is occupied by package statement

    header_class = False
    for imp in import_statements:
        line_dict[line_number] = imp
        line_number += 1

    for interface in interface_statements:
        line_dict[line_number] = interface
        line_number += 1

    for each_class in obfuscated_classes:
        if not header_class:
            for line in each_class:
                line_dict[line_number] = line
                line_number += 1
            header_class = True
        else:
            for line in each_class:
                if "public class" in line:
                    line = line.replace("public class", "class")
                line_dict[line_number] = line
                line_number += 1


    return line_dict


if __name__ == '__main__':
    main()

