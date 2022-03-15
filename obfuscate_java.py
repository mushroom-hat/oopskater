import re
import random

# Change here
TEST_FILE = r"C:\Users\tayzh\Documents\SIT\Year 1 Sem 2\ICT2207 Mobile Security\Project\Coursework1\ict2207-labP5-team4-2022-coursework\Coursework1\Project\app\src\main\java\com\singaporetech\audiorecorder\Exfiltration.java"
OBFUS_TESTFILE = r"C:\Users\tayzh\Documents\SIT\Year 1 Sem 2\ICT2207 Mobile Security\Project\Coursework2 (Working Dir)\test.java"
FILEPATH = r"C:\Users\tayzh\Documents\SIT\Year 1 Sem 2\ICT2207 Mobile Security\Project\Coursework1\ict2207-labP5-team4-2022-coursework\Coursework1\Project\app\src\main\java\com\singaporetech\audiorecorder\Exfiltration.java"
VARIABLES_DICT = r"C:\Users\tayzh\Documents\SIT\Year 1 Sem 2\ICT2207 Mobile Security\Project\Coursework2 (Working Dir)\variables.dict"
OK = 1
BAD = 0

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

RENAME_DICT = readfile(VARIABLES_DICT)  ## this dictionary stores all the variables that were renamed and the renamed string

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
    # identify the methods for each class
    while i < len(each_class):
        java_fn = []
        line = each_class[i]
        line_number = i
        number_of_function_lines = 0
        # check if line is the start of function
        if ("public" in line or "private" in line) and ("{" in line or "{" in each_class[line_number + 1]) and ";" not in line:  # start of function
            # append current line and move to next line
            java_fn.append(line)
            next_line_number = line_number + 1

            # while next line is not a "start-of-function" line, increment the number of function lines and append the line to its function.
            while next_line_number < len(each_class) and not (("public" in each_class[next_line_number] or "private" in each_class[next_line_number]) and ("{" in each_class[next_line_number] or "{" in each_class[next_line_number + 1]) and "extends" not in each_class[next_line_number] and ";" not in each_class[next_line_number]):
                number_of_function_lines += 1
                java_fn.append(each_class[next_line_number])
                next_line_number += 1

            methods.append(java_fn)
            i += number_of_function_lines
        else:
            i += 1

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

        if "public class" in line or "private class" in line:
            each_class.append(line)
            next_line = line_number + 1
            while next_line <= len(line_dict) and ("public class" not in line_dict[next_line] or "private class" not in line_dict[next_line]):
                each_class.append(line_dict[next_line])
                next_line += 1

            class_definitions.append(each_class)

    return package_statement, import_statements, interface_statements, class_definitions

def write_to_file(line_dict):
    obfus_code = []
    write_f = open(OBFUS_TESTFILE, "w")

    for line_number, line in line_dict.items():
        write_f.write(line)

# takes in a list of java functions and change variables in each function
# NOT DONE
def rename_variables(method):
    obfuscated_method = []
    for line in method:
        methodname = re.search(r'([a-zA-Z0-9_]+) =', line)
        if methodname:
            #print(methodname.group(0))
            pass
    random_numb = random.randint(0, 9999)
    random_variable_name = list(RENAME_DICT[random_numb])

    return method

# obfuscate each method in a class, returns a class
def obfuscate(java_methods):
    methods = []
    obfuscated_methods = []
    for each_method in java_methods:
        print(each_method)
        each_method = rename_variables(each_method)
        methods.append(each_method)
        obfuscated_methods = obfuscated_methods + each_method

    return obfuscated_methods

def main():
    line_dict = readfile(FILEPATH)
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
        java_methods = identify_java_methods(each_class)
        obfuscated_classes.append(obfuscate(java_methods))

    # line_dict = remove_spaces(line_dict)

    # CONTROL FLOW OBFUSCATION ------------

    # repackage into a
    line_dict = repackage(package_statement, import_statements, interface_statements, obfuscated_classes)
    write_to_file(line_dict)
    #  write_to_file(code)

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

    return line_dict

if __name__ == '__main__':
    main()

