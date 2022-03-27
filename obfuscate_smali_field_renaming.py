import util
import common_regex_pattern


def rename_field(field_name):
    """ This function will rename the field name given."""
    field_md5 = util.get_string_md5(field_name)
    return "f{0}".format(field_md5.lower()[:8])


def get_class_names(smali_files):
    """ THis function will take in a list of smali files and return the classes found. """
    class_names = set()
    for smali_file in smali_files:
        with open(smali_file, "r", encoding="utf-8") as current_file:
            for line in current_file:
                class_match = common_regex_pattern.CLASS_PATTEN.match(line)
                if class_match:
                    if class_match.group("class_name").startswith(("Landroid", "Ljava")):
                        class_names.add(class_match.group("class_name"))
                    break
    return class_names


def rename_field_declarations(smali_files):
    renamed_fields = set()

    """ This will loop through all the smali files to find field definitions that can be renamed. """
    for smali_file in util.show_list_progress(smali_files, interactive=False,
                                              description="Renaming field declarations"):
        with util.inplace_edit_file(smali_file) as (in_file, out_file):
            class_name = None
            for line in in_file:
                ignore = False

                if not class_name:
                    class_match = common_regex_pattern.CLASS_PATTEN.match(line)
                    if class_match:
                        class_name = class_match.group("class_name")

                """Finding the field declaration in class."""
                field_match = common_regex_pattern.FIELD_PATTERN.match(line)
                if class_name.startswith(tuple([])):
                    ignore = True

                if field_match:
                    field_name = field_match.group("field_name")
                    """Check if subfields and user defined packages is found, we want to avoid it."""
                    if not ignore and "$" not in field_name:

                        """Renaming field declaration and add some random fields."""
                        line = line.replace(
                            "{0}:".format(field_name),
                            "{0}:".format(rename_field(field_name)),
                        )
                        out_file.write(line)

                        for _ in range(util.get_random_int(1, 4)):
                            out_file.write("\n")
                            out_file.write(line.replace(":", "{0}:".format(util.get_random_string(8)),))

                        field = "{field_name}:{field_type}".format(
                            field_name=field_match.group("field_name"),
                            field_type=field_match.group("field_type"),
                        )
                        renamed_fields.add(field)
                    else:
                        out_file.write(line)
                else:
                    out_file.write(line)
    return renamed_fields


def rename_field_references(fields_to_rename, smali_files, sdk_classes):
    count = 0
    for smali_file in util.show_list_progress(smali_files, interactive=False, description="Renaming references"):
        with util.inplace_edit_file(smali_file) as (in_file, out_file):
            for line in in_file:
                """ Finding field usage"""
                field_usage_match = common_regex_pattern.FIELD_USAGE_PATTEN.match(line)
                if field_usage_match:
                    field = "{field_name}:{field_type}".format(
                        field_name=field_usage_match.group("field_name"),
                        field_type=field_usage_match.group("field_type"),
                    )
                    class_name = field_usage_match.group("field_object")
                    field_name = field_usage_match.group("field_name")
                    if field in fields_to_rename and (
                            not class_name.startswith(("Landroid", "Ljava"))
                            or class_name in sdk_classes
                    ):
                        """ Renaming field usage """
                        count += 1
                        out_file.write(
                            line.replace("{0}:".format(field_name), "{0}:".format(rename_field(field_name)))
                        )
                    else:
                        out_file.write(line)
                else:
                    out_file.write(line)
    return count


def rename(smali_files):
    try:
        sdk_class_declarations = get_class_names(smali_files)
        renamed_field_declarations = rename_field_declarations(smali_files)
        count = rename_field_references(renamed_field_declarations, smali_files, sdk_class_declarations)
        return count
    except:
        print("Something went wrong with renaming.")
