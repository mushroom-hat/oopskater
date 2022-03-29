import random

import util
import common_regex_pattern

PARAM_TYPES = ["Ljava/lang/String;", "Z", "B", "S", "C", "I", "F"]


def add_method_overloading(smali_file, overloaded_method_body, class_names_to_ignore):
    global PARAM_TYPES
    new_methods_num: int = 0
    with util.edit_file_content(smali_file) as (in_file, out_file):

        skip_remaining_lines = False
        class_name = None
        for line in in_file:

            if skip_remaining_lines:
                out_file.write(line)
                continue

            if not class_name:
                class_match = common_regex_pattern.CLASS_PATTEN.match(line)
                # If this is an enum class, skip it.
                if " enum " in line:
                    skip_remaining_lines = True
                    out_file.write(line)
                    continue
                elif class_match:
                    class_name = class_match.group("class_name")
                    if class_name in class_names_to_ignore:
                        # The methods of this class should be ignored when
                        # renaming, so proceed with the next class.
                        skip_remaining_lines = True
                    out_file.write(line)
                    continue

            # Skip virtual methods, consider only the direct methods defined
            # earlier in the file.
            if line.startswith("# virtual methods"):
                skip_remaining_lines = True
                out_file.write(line)
                continue

            # Method declared in class.
            method_match = common_regex_pattern.METHOD_PATTEN.match(line)

            # Avoid constructors, native and abstract methods.
            if (
                    method_match
                    and "<init>" not in line
                    and "<clinit>" not in line
                    and " native " not in line
                    and " abstract " not in line
            ):
                # Create lists with random parameters to be added to the method
                # signature. Add 3 overloads for each method and for each overload
                # use 4 random params.
                for params in util.get_random_list_permutations(
                        random.sample(PARAM_TYPES, 4)
                )[:3]:
                    new_param = "".join(params)
                    # Update parameter list and add void return type.
                    overloaded_signature = line.replace(
                        "({0}){1}".format(
                            method_match.group("method_param"),
                            method_match.group("method_return"),
                        ),
                        "({0}{1})V".format(
                            method_match.group("method_param"), new_param
                        ),
                    )
                    out_file.write(overloaded_signature)
                    out_file.write(overloaded_method_body)
                    new_methods_num += 1

                # Print original method.
                out_file.write(line)
            else:
                out_file.write(line)

    return new_methods_num


def get_android_class_names(file_name):
    return util.get_non_empty_lines_from_file(file_name)


def add_method_overloading_algorithm(smali_files, class_names_to_ignore, max_methods_to_add: int = 2):
    overloaded_method_body = util.get_smali_method_overload()
    added_methods = 0
    count = 0
    for smali_file in smali_files:
        if added_methods < max_methods_to_add:
            added_methods += add_method_overloading(
                smali_file, overloaded_method_body, class_names_to_ignore
            )
            count += 1
        else:
            break
    return count
