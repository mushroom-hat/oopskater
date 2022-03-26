import os
import re

import util

ANDROID_CLASS_NAMES = util.get_android_class_names()
OBFUSCATOR_INSTRUCTION_LENGTH: int = 0
OBFUSCATOR_INSTRUCTION_LIMIT: int = 60000
PRIMITIVE_TYPES = {"I", "Z", "B", "S", "J", "F", "D", "C"}
METHODS_WITH_REFLECTION = 0
CLASS_NAME_TO_SMALI_FILE: dict = {}


def class_is_public_and_declared_in_smali(class_name):
    global ANDROID_CLASS_NAMES
    global OBFUSCATOR_INSTRUCTION_LENGTH
    global OBFUSCATOR_INSTRUCTION_LIMIT
    global PRIMITIVE_TYPES
    global METHODS_WITH_REFLECTION
    global CLASS_NAME_TO_SMALI_FILE
    smali_file = CLASS_NAME_TO_SMALI_FILE.get(class_name, None)

    # The smali of this class is not present (this is probably a system class).
    if not smali_file:
        return False

    with open(smali_file, "r", encoding="utf-8") as current_file:
        for line in current_file:
            # Check if this is a public non abstract class.
            class_match = util.CLASS_PATTEN.match(line)
            if class_match:
                if " public " in line and " abstract " not in line:
                    return True
                else:
                    return False


def method_is_all_public(class_name, method_signature, param_string):
    global ANDROID_CLASS_NAMES
    global OBFUSCATOR_INSTRUCTION_LENGTH
    global OBFUSCATOR_INSTRUCTION_LIMIT
    global PRIMITIVE_TYPES
    global METHODS_WITH_REFLECTION
    global CLASS_NAME_TO_SMALI_FILE
    if not class_is_public_and_declared_in_smali(class_name):
        return False

    smali_file = CLASS_NAME_TO_SMALI_FILE[class_name]
    with open(smali_file, "r", encoding="utf-8") as current_file:
        for line in current_file:
            if " public " in line:
                method_match = util.METHOD_PATTEN.match(line)
                if method_match:
                    signature = (
                        "{method_name}({method_param})"
                        "{method_return}".format(
                            method_name=method_match.group("method_name"),
                            method_param=method_match.group("method_param"),
                            method_return=method_match.group("method_return"),
                        )
                    )
                    if signature == method_signature:
                        # Public method declared in public class, let's check if all
                        # its parameters are public.
                        for param in split_method_params(param_string):
                            # System classes that are public.
                            if param in PRIMITIVE_TYPES or param in ANDROID_CLASS_NAMES:
                                continue

                            # The class of this parameter is not present in the
                            # smali files or is not public.
                            if not class_is_public_and_declared_in_smali(param):
                                return False
                        return True
    return False


def split_method_params(param_string):
    global ANDROID_CLASS_NAMES
    global OBFUSCATOR_INSTRUCTION_LENGTH
    global OBFUSCATOR_INSTRUCTION_LIMIT
    global PRIMITIVE_TYPES
    global METHODS_WITH_REFLECTION
    global CLASS_NAME_TO_SMALI_FILE
    params = []
    possible_classes = param_string.split(";")
    for possible_class in possible_classes:
        # Make sure the parameter list is not empty.
        if possible_class:
            if possible_class.startswith("L"):
                # Class.
                params.append("{0};".format(possible_class))
            elif possible_class.startswith("["):
                # Array + other optional parameters (e.g. [ILjava/lang/Object).
                for string_position in range(1, len(possible_class)):
                    if possible_class[string_position] == "[":
                        # Multi-dimensional array, proceed with the next char.
                        continue
                    elif possible_class[string_position] == "L":
                        # Class array, no need to proceed with the next char.
                        params.append("{0};".format(possible_class))
                        break
                    else:
                        # Primitive type array, add it to the list and proceed with
                        # the rest of the string
                        params.append(possible_class[: string_position + 1])
                        params.extend(
                            split_method_params(
                                possible_class[string_position + 1:]
                            )
                        )
                        break
            elif possible_class[0] in PRIMITIVE_TYPES:
                # Primitive type + other optional parameters
                # (e.g. ILjava/lang/Object).
                params.append(possible_class[0])
                params.extend(split_method_params(possible_class[1:]))

    return params


def count_needed_registers(params):
    global ANDROID_CLASS_NAMES
    global OBFUSCATOR_INSTRUCTION_LENGTH
    global OBFUSCATOR_INSTRUCTION_LIMIT
    global PRIMITIVE_TYPES
    global METHODS_WITH_REFLECTION
    global CLASS_NAME_TO_SMALI_FILE
    needed_registers: int = 0
    for param in params:
        # Long and double variables need 2 registers.
        if param == "J" or param == "D":
            needed_registers += 2
        else:
            needed_registers += 1
    return needed_registers


def add_smali_reflection_code(class_name, method_name, param_string):
    global ANDROID_CLASS_NAMES
    global OBFUSCATOR_INSTRUCTION_LENGTH
    global OBFUSCATOR_INSTRUCTION_LIMIT
    global PRIMITIVE_TYPES
    global METHODS_WITH_REFLECTION
    global CLASS_NAME_TO_SMALI_FILE
    params = split_method_params(param_string)

    smali_code = "\n\tconst/4 v1, {param_num:#x}\n\n".format(param_num=len(params))
    OBFUSCATOR_INSTRUCTION_LENGTH += 1

    if len(params) > 0:
        smali_code += "\tnew-array v1, v1, [Ljava/lang/Class;\n\n"
        OBFUSCATOR_INSTRUCTION_LENGTH += 2

    for param_index, param in enumerate(params):
        smali_code += "\tconst/4 v2, {param_num:#x}\n\n".format(param_num=param_index)
        OBFUSCATOR_INSTRUCTION_LENGTH += 1

        class_param = util.SGET_DICT.get(param, None)
        if class_param:
            smali_code += "\tsget-object v3, {param}\n\n".format(param=class_param)
            OBFUSCATOR_INSTRUCTION_LENGTH += 2
        else:
            smali_code += "\tconst-class v3, {param}\n\n".format(param=param)
            OBFUSCATOR_INSTRUCTION_LENGTH += 2

        smali_code += "\taput-object v3, v1, v2\n\n"
        OBFUSCATOR_INSTRUCTION_LENGTH += 2

    smali_code += (
        "\tconst-class v2, {class_name}\n\n"
        '\tconst-string v3, "{method_name}"\n\n'.format(
            class_name=class_name, method_name=method_name
        )
    )
    OBFUSCATOR_INSTRUCTION_LENGTH += 4

    smali_code += (
        "\tinvoke-virtual {v2, v3, v1}, Ljava/lang/Class;->"
        "getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)"
        "Ljava/lang/reflect/Method;\n\n"
    )
    OBFUSCATOR_INSTRUCTION_LENGTH += 3

    smali_code += (
        "\tmove-result-object v1\n\n"
        "\tsget-object v2, Lcom/apireflectionmanager/ApiReflection;->"
        "obfuscatedMethods:Ljava/util/List;\n\n"
    )
    OBFUSCATOR_INSTRUCTION_LENGTH += 3

    smali_code += (
        "\tinvoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z\n"
    )
    OBFUSCATOR_INSTRUCTION_LENGTH += 3

    return smali_code


def create_reflection_method(num_of_methods: int, local_count: int, is_virtual_method: bool, invoke_registers: str,
                             invoke_parameters: str):
    global ANDROID_CLASS_NAMES
    global OBFUSCATOR_INSTRUCTION_LENGTH
    global OBFUSCATOR_INSTRUCTION_LIMIT
    global PRIMITIVE_TYPES
    global METHODS_WITH_REFLECTION
    global CLASS_NAME_TO_SMALI_FILE
    # Split method passed registers (if the method has no registers there is an
    # empty line that has to be removed, that's why strip() is used).
    invoke_registers = [
        register.strip()
        for register in invoke_registers.split(", ")
        if register.strip()
    ]

    params = split_method_params(invoke_parameters)

    param_to_register = []  # list[i][0] = i-th param, list[i][1] = [i-th param register(s)]

    if is_virtual_method:
        # If this is a virtual method, the first register is the object instance
        # and not a parameter.
        register_index = 1
        for param in params:
            # Long and double variables need 2 registers.
            if param == "J" or param == "D":
                param_to_register.append(
                    [param, invoke_registers[register_index: register_index + 2]]
                )
                register_index += 2
            else:
                param_to_register.append(
                    [param, [invoke_registers[register_index]]]
                )
                register_index += 1
    else:
        # This is a static method, so we don't need a reference to the object
        # instance. If this is a virtual method, the first register is the object
        # instance and not a parameter.
        register_index = 0
        for param in params:
            # Long and double variables need 2 registers.
            if param == "J" or param == "D":
                param_to_register.append(
                    [param, invoke_registers[register_index: register_index + 2]]
                )
                register_index += 2
            else:
                param_to_register.append(
                    [param, [invoke_registers[register_index]]]
                )
                register_index += 1

    smali_code = "\tconst/4 #reg1#, {register_num:#x}\n\n".format(
        register_num=len(params)
    )

    if len(params) > 0:
        smali_code += "\tnew-array #reg1#, #reg1#, [Ljava/lang/Object;\n\n"
        for param_index, param_and_register in enumerate(param_to_register):
            # param_and_register[0] = parameter type
            # param_and_register[1] = [register(s) holding the passed parameter(s)]
            cast_primitive_to_class = util.CAST_DICT.get(
                param_and_register[0], None
            )

            if cast_primitive_to_class:
                if len(param_and_register[1]) > 1:
                    # 2 register parameter.
                    smali_code += (
                        "\tinvoke-static {{{register_pair}}}, {cast}\n\n"
                        "\tmove-result-object #reg2#\n\n".format(
                            register_pair=", ".join(param_and_register[1]),
                            cast=cast_primitive_to_class,
                        )
                    )
                else:
                    smali_code += (
                        "\tinvoke-static {{{register}}}, {cast}\n\n"
                        "\tmove-result-object #reg2#\n\n".format(
                            register=param_and_register[1][0],
                            cast=cast_primitive_to_class,
                        )
                    )

                smali_code += (
                    "\tconst/4 #reg4#, {param_index:#x}\n\n"
                    "\taput-object #reg2#, #reg1#, #reg4#\n\n".format(
                        param_index=param_index
                    )
                )

            else:
                smali_code += (
                    "\tconst/4 #reg3#, {param_index:#x}\n\n"
                    "\taput-object {register}, #reg1#, #reg3#\n\n".format(
                        param_index=param_index, register=param_and_register[1][0]
                    )
                )

    smali_code += "\tconst/16 #reg3#, {method_num:#x}\n\n".format(
        method_num=num_of_methods
    )

    if is_virtual_method:
        smali_code += (
            "\tinvoke-static {{#reg3#, {obj_instance}, #reg1#}}, "
            "Lcom/apireflectionmanager/ApiReflection;->"
            "obfuscate(ILjava/lang/Object;[Ljava/lang/Object;)"
            "Ljava/lang/Object;\n".format(obj_instance=invoke_registers[0])
        )
    else:
        smali_code += "\tconst/4 #reg4#, 0x0\n\n"
        smali_code += (
            "\tinvoke-static {#reg3#, #reg4#, #reg1#}, "
            "Lcom/apireflectionmanager/ApiReflection;->"
            "obfuscate(ILjava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;\n"
        )

    for index in range(0, 4):
        smali_code = smali_code.replace(
            "#reg{0}#".format(index + 1), "v{0}".format(local_count + index)
        )

    return smali_code


def reflection(list_of_smali_files):
    global ANDROID_CLASS_NAMES
    global OBFUSCATOR_INSTRUCTION_LENGTH
    global OBFUSCATOR_INSTRUCTION_LIMIT
    global PRIMITIVE_TYPES
    global METHODS_WITH_REFLECTION
    global CLASS_NAME_TO_SMALI_FILE
    try:
        for smali_file in util.show_list_progress(list_of_smali_files, interactive=False,
                                                  description="Class name to smali file mapping", ):
            CLASS_NAME_TO_SMALI_FILE = {}

            with open(smali_file, "r", encoding="utf-8") as current_file:
                class_name = None
                for line in current_file:
                    if not class_name:
                        # Every smali file contains a class.
                        class_match = util.CLASS_PATTEN.match(line)
                        if class_match:
                            CLASS_NAME_TO_SMALI_FILE[class_match.group("class_name")] = smali_file
                            break

        obfuscator_smali_code: str = ""

        move_result_pattern = re.compile(r"\s+move-result.*?\s(?P<register>[vp0-9]+)")

        for smali_file in util.show_list_progress(list_of_smali_files, interactive=False,
                                                  description="Obfuscating using reflection"):
            OBFUSCATOR_INSTRUCTION_LENGTH = 0
            OBFUSCATOR_INSTRUCTION_LIMIT = 60000
            # print('Obfuscating using reflection in file "{0}"'.format(smali_file))

            # There is no space for further reflection instructions.
            if OBFUSCATOR_INSTRUCTION_LENGTH >= OBFUSCATOR_INSTRUCTION_LIMIT:
                break

            with open(smali_file, "r", encoding="utf-8") as current_file:
                lines = current_file.readlines()

            # Line numbers where a method is declared.
            method_index = []

            # For each method in method_index, True if there are enough registers
            # to perform some operations by using reflection, False otherwise.
            method_is_reflectable = []

            # The number of local registers of each method in method_index.
            method_local_count = []

            # Find the method declarations in this smali file.
            for line_number, line in enumerate(lines):
                method_match = util.METHOD_PATTEN.match(line)
                if method_match:
                    method_index.append(line_number)
                    param_count = count_needed_registers(split_method_params(method_match.group("method_param")))

                    # Save the number of local registers of this method.
                    local_count = 16
                    local_match = util.LOCALS_PATTERN.match(lines[line_number + 1])
                    if local_match:
                        local_count = int(local_match.group("local_count"))
                        method_local_count.append(local_count)
                    else:
                        # For some reason the locals declaration was not found where
                        # it should be, so assume the local registers are all used.
                        method_local_count.append(local_count)

                    # If there are enough registers available we can perform some
                    # reflection operations.
                    if param_count + local_count <= 11:
                        method_is_reflectable.append(True)
                    else:
                        method_is_reflectable.append(False)

            # Look for method invocations inside the methods declared in this
            # smali file, and change normal invocations with invocations through
            # reflection.
            for method_number, index in enumerate(method_index):

                # If there are enough registers for reflection operations, look for
                # method invocations inside each method's body.
                if method_is_reflectable[method_number]:
                    current_line_number = index
                    while not lines[current_line_number].startswith(".end method"):

                        # There is no space for further reflection instructions.
                        if OBFUSCATOR_INSTRUCTION_LENGTH >= OBFUSCATOR_INSTRUCTION_LIMIT:
                            break

                        current_line_number += 1
                        invoke_match = util.INVOKE_PATTERN.match(lines[current_line_number])
                        if invoke_match and "<init>" not in lines[current_line_number]:

                            # The method belongs to an Android class or is
                            # invoked on an array.
                            if invoke_match.group("invoke_object") in ANDROID_CLASS_NAMES or invoke_match.group(
                                    "invoke_object").startswith("["):
                                continue

                            method_signature = (
                                "{method_name}({method_param})"
                                "{method_return}".format(
                                    method_name=invoke_match.group("invoke_method"),
                                    method_param=invoke_match.group("invoke_param"),
                                    method_return=invoke_match.group(
                                        "invoke_return"
                                    ),
                                )
                            )

                            # The method to reflect has to be public, has to be
                            # declared in a public class and all its parameters
                            # have to be public.
                            if not method_is_all_public(invoke_match.group("invoke_object"), method_signature,
                                                        invoke_match.group("invoke_param")):
                                continue

                            if (
                                    invoke_match.group("invoke_type")
                                    == "invoke-virtual"
                            ):
                                tmp_is_virtual = True
                            elif (
                                    invoke_match.group("invoke_type") == "invoke-static"
                            ):
                                tmp_is_virtual = False
                            else:
                                continue

                            tmp_register = invoke_match.group("invoke_pass")
                            tmp_class_name = invoke_match.group("invoke_object")
                            tmp_method = invoke_match.group("invoke_method")
                            tmp_param = invoke_match.group("invoke_param")
                            tmp_return_type = invoke_match.group("invoke_return")

                            # Check if the method invocation result is used in
                            # the following lines.
                            for move_result_index in range(
                                    current_line_number + 1,
                                    min(current_line_number + 10, len(lines) - 1),
                            ):
                                if "invoke-" in lines[move_result_index]:
                                    # New method invocation, the previous method
                                    # result is not used.
                                    break

                                move_result_match = move_result_pattern.match(
                                    lines[move_result_index]
                                )
                                if move_result_match:
                                    tmp_result_register = move_result_match.group(
                                        "register"
                                    )

                                    # Fix the move-result instruction after the
                                    # method invocation.
                                    new_move_result = ""
                                    if tmp_return_type in PRIMITIVE_TYPES:
                                        new_move_result += (
                                            "\tmove-result-object "
                                            "{result_register}\n\n"
                                            "\tcheck-cast {result_register}, "
                                            "{result_class}\n\n".format(
                                                result_register=tmp_result_register,
                                                result_class=util.TYPE_DICT[tmp_return_type],
                                            )
                                        )

                                        new_move_result += "\tinvoke-virtual " "{{{result_register}}}, {cast}\n\n" \
                                            .format(
                                            result_register=tmp_result_register,
                                            cast=util.REVERSE_CAST_DICT[tmp_return_type],
                                        )

                                        if (
                                                tmp_return_type == "J"
                                                or tmp_return_type == "D"
                                        ):
                                            new_move_result += (
                                                "\tmove-result-wide "
                                                "{result_register}\n".format(
                                                    result_register=tmp_result_register
                                                )
                                            )
                                        else:
                                            new_move_result += (
                                                "\tmove-result "
                                                "{result_register}\n".format(
                                                    result_register=tmp_result_register
                                                )
                                            )

                                    else:
                                        new_move_result += (
                                            "\tmove-result-object "
                                            "{result_register}\n\n"
                                            "\tcheck-cast {result_register}, "
                                            "{return_type}\n".format(
                                                result_register=tmp_result_register,
                                                return_type=tmp_return_type,
                                            )
                                        )

                                    lines[move_result_index] = new_move_result

                            # Add the original method to the list of methods
                            # using reflection.
                            obfuscator_smali_code += add_smali_reflection_code(tmp_class_name, tmp_method, tmp_param)

                            # Change the original code with code using reflection.
                            lines[
                                current_line_number
                            ] = create_reflection_method(
                                METHODS_WITH_REFLECTION,
                                method_local_count[method_number],
                                tmp_is_virtual,
                                tmp_register,
                                tmp_param,
                            )

                            METHODS_WITH_REFLECTION += 1

                            # Add the registers needed for performing reflection.
                            lines[index + 1] = "\t.locals {0}\n".format(
                                method_local_count[method_number] + 4
                            )

            with open(smali_file, "w", encoding="utf-8") as current_file:
                current_file.writelines(lines)

        # Add to the app the code needed for the reflection obfuscator. The code
        # can be put in any smali directory, since it will be moved to the correct
        # directory when rebuilding the application.
        destination_dir = os.path.dirname(list_of_smali_files[0])
        destination_file = os.path.join(destination_dir, "ApiReflection.smali")
        with open(destination_file, "w", encoding="utf-8") as api_reflection_smali:
            reflection_code = util.get_api_reflection_smali_code().replace(
                "#!code_to_replace!#", obfuscator_smali_code
            )
            api_reflection_smali.write(reflection_code)

    except:
        print("Something went wrong with the reflection.")
