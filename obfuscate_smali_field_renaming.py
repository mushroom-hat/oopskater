import util

def rename_field(field_name):
    field_md5 = util.get_string_md5(field_name)
    return "f{0}".format(field_md5.lower()[:8])

def get_sdk_class_names(smali_files):
    class_names = set()
    for smali_file in smali_files:
        with open(smali_file, "r", encoding="utf-8") as current_file:
            for line in current_file:
                class_match = util.CLASS_PATTEN.match(line)
                if class_match:
                    # This is probably a SDK class, but we have its declaration so
                    # we can change the fields inside it.
                    if class_match.group("class_name").startswith(("Landroid", "Ljava")):
                        class_names.add(class_match.group("class_name"))
                    # There is only one class declaration per file.
                    break
    return class_names

def rename_field_declarations(smali_files):
    renamed_fields = set()

    # Search for field definitions that can be renamed.
    for smali_file in util.show_list_progress(smali_files, interactive=False,description="Renaming field declarations"):
        with util.inplace_edit_file(smali_file) as (in_file, out_file):
            class_name = None
            for line in in_file:
                ignore = False

                if not class_name:
                    class_match = util.CLASS_PATTEN.match(line)
                    if class_match:
                        class_name = class_match.group("class_name")

                # Field declared in class.
                field_match = util.FIELD_PATTERN.match(line)

                if class_name.startswith(tuple([])):
                    ignore = True

                if field_match:
                    field_name = field_match.group("field_name")
                    # Avoid sub-fields and user defined packages.
                    if not ignore and "$" not in field_name:
                        # Rename field declaration (usages of this field will be
                        # renamed later) and add some random fields.
                        line = line.replace(
                            "{0}:".format(field_name),
                            "{0}:".format(rename_field(field_name)),
                        )
                        out_file.write(line)


                        for _ in range(util.get_random_int(1, 4)):
                            out_file.write("\n")
                            out_file.write(
                                line.replace(
                                    ":",
                                    "{0}:".format(util.get_random_string(8)),
                                )
                            )

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
                # Field usage.
                field_usage_match = util.FIELD_USAGE_PATTEN.match(line)
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
                        # Rename field usage.
                        count += 1
                        out_file.write(
                            line.replace("{0}:".format(field_name),"{0}:".format(rename_field(field_name)))
                        )
                    else:
                        out_file.write(line)
                else:
                    out_file.write(line)
    return count

def rename(smali_files):
    try:
        sdk_class_declarations = get_sdk_class_names(smali_files)
        renamed_field_declarations = set()



        # if obfuscation_info.is_multidex():
        #     for index, dex_smali_files in enumerate(util.show_list_progress(
        #                 obfuscation_info.get_multidex_smali_files(),
        #                 interactive=False,
        #                 unit="dex",
        #                 description="Processing multidex",
        #             )
        #     ):
        #         self.max_fields_to_add = (obfuscation_info.get_remaining_fields_per_obfuscator()[index])
        #         added_fields = 0
        #         renamed_field_declarations.update(rename_field_declarations(dex_smali_files))
        # else:
        renamed_field_declarations = rename_field_declarations(smali_files)

        # When renaming field references it makes no difference if this is a
        # multidex application, since at this point we are not introducing any new
        # field.
        count = rename_field_references(renamed_field_declarations, smali_files, sdk_class_declarations)
        return count


    except:
        print("Something went wrong with renaming.")


