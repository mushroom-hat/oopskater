import random

import util

PARAM_TYPES = ["Ljava/lang/String;", "Z", "B", "S", "C", "I", "F"]


def add_method_overloads_to_file(smali_file, overloaded_method_body, class_names_to_ignore):
    global PARAM_TYPES
    with util.inplace_edit_file(smali_file) as (in_file, out_file):
        skip_remaining_lines = False
        class_name = None
        for line in in_file:
            if skip_remaining_lines:
                out_file.write(line)
                continue

            if not class_name:
                class_match = util.CLASS_PATTEN.match(line)
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
            method_match = util.METHOD_PATTEN.match(line)

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
                # Print original method.
                out_file.write(line)
            else:
                out_file.write(line)
    return 1


def get_android_class_names(file_name):
    return util.get_non_empty_lines_from_file(file_name)


def add_method_overloads(smali_file):
    try:
        method_overload_body_file = open("resources/overloaded_method_body.smali.txt", "r", encoding="utf-8")
        overloaded_method_body = method_overload_body_file.read()
        if add_method_overloads_to_file(smali_file, overloaded_method_body,
                                        set(get_android_class_names("resources/android_class_names_api.txt"))):
            return 1
        return 0
    except:
        return 0
