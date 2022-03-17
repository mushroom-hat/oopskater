import os
import re
import hashlib
import util
from typing import List, Set, Dict, Union
from os import walk
import xml.etree.cElementTree as Xml

STRING_PATTERN = re.compile(r'"(?P<string_value>\S+?)"', re.UNICODE)
SUBCLASS_NAME_PATTERN = re.compile(
        r'\s+name\s=\s"(?P<subclass_name>\S+?)"', re.UNICODE
    )
SPLIT_CLASS_PATTERN = re.compile(r"[/$]")
# L<class_name>;  # Every class name starts with L and ends with ;
CLASS_NAME_PATTERN = re.compile(r"L[^():\s]+?;", re.UNICODE)
# .class <other_optional_stuff> <class_name;>  # Every class name ends with ;
CLASS_PATTERN = re.compile(r"\.class.+?(?P<class_name>\S+?;)", re.UNICODE)

PACKAGE_NAME = None
ENCRYPTED_PACKAGE_NAME = None
IGNORE_PACKAGE_NAME = []
CLASS_NAME_TO_SMALI_FILE: dict = {}


def encrypt_identifier(identifier):
    identifier_md5 = util.get_string_md5(identifier)
    return "p{0}".format(identifier_md5.lower()[:8])


def slash_to_dot_notation_for_classes(rename_transformations):
    dot_rename_transformations: Dict[str, str] = {}

    # Remove leading L and trailing ; from class names and replace / and $ with .
    for old_name, new_name in rename_transformations.items():
        dot_rename_transformations[
            old_name[1:-1].replace("/", ".").replace("$", ".")
        ] = (new_name[1:-1].replace("/", ".").replace("$", "."))

    return dot_rename_transformations

def transform_package_name(manifest_xml_root):
    global PACKAGE_NAME
    global ENCRYPTED_PACKAGE_NAME
    ENCRYPTED_PACKAGE_NAME = ".".join(
        [encrypt_identifier(token) for token in PACKAGE_NAME.split(".")]
    )
    # Rename package name in manifest file.
    manifest_xml_root.set("package", ENCRYPTED_PACKAGE_NAME)
    manifest_xml_root.set(
        "{http://schemas.android.com/apk/res/android}sharedUserId",
        "{0}.uid.shared".format(util.get_random_string(16)),
    )


def rename_class_declarations(list_of_smali_file, interactive: bool = False):
    renamed_classes = {}
    annotation_flag = False
    # Search for class declarations that can be renamed.
    for smali_file in util.show_list_progress(
            list_of_smali_file,
            interactive=interactive,
            description="Renaming class declarations",
    ):
        with util.inplace_edit_file(smali_file) as (in_file, out_file):
            skip_remaining_lines = False
            class_name = None
            r_class = False
            for line in in_file:

                if skip_remaining_lines:
                    out_file.write(line)
                    continue

                if not class_name:
                    class_match = util.CLASS_PATTEN.match(line)
                    if class_match:
                        class_name = class_match.group("class_name")

                        ignore_class = class_name.startswith(
                            tuple([])
                        )

                        # Split class name to its components and encrypt them.
                        class_tokens = SPLIT_CLASS_PATTERN.split(
                            class_name[1:-1]
                        )

                        encrypted_class_name = "L"
                        separator_index = 1
                        for token in class_tokens:
                            separator_index += len(token)
                            if token == "R":
                                r_class = True
                            if token.isdigit():
                                encrypted_class_name += (
                                        token + class_name[separator_index]
                                )
                            elif not r_class and not ignore_class:
                                encrypted_class_name += (
                                        encrypt_identifier(token)
                                        + class_name[separator_index]
                                )
                            else:
                                encrypted_class_name += (
                                        token + class_name[separator_index]
                                )
                            separator_index += 1

                        out_file.write(
                            line.replace(class_name, encrypted_class_name)
                        )

                        renamed_classes[class_name] = encrypted_class_name
                        continue

                if (
                        line.strip()
                        == ".annotation system Ldalvik/annotation/InnerClass;"
                ):
                    annotation_flag = True
                    out_file.write(line)
                    continue

                if  annotation_flag and 'name = "' in line:
                    # Subclasses have to be renamed as well.
                    subclass_match = SUBCLASS_NAME_PATTERN.match(line)
                    if subclass_match and not r_class:
                        subclass_name = subclass_match.group("subclass_name")
                        out_file.write(
                            line.replace(
                                subclass_name,
                                encrypt_identifier(subclass_name),
                            )
                        )
                    else:
                        out_file.write(line)
                    continue

                if line.strip() == ".end annotation":
                    annotation_flag = False
                    out_file.write(line)
                    continue

                # Method declaration reached, no more class definitions in
                # this file.
                if line.startswith(".method "):
                    skip_remaining_lines = True
                    out_file.write(line)
                else:
                    out_file.write(line)
    return renamed_classes





def rename_class_usages_in_smali(list_of_smali_files, rename_transformations, interactive: bool = False):
    global PACKAGE_NAME
    global ENCRYPTED_PACKAGE_NAME
    dot_rename_transformations = slash_to_dot_notation_for_classes(rename_transformations)
    count = 0
    # Adding package name.
    dot_rename_transformations[PACKAGE_NAME] = ENCRYPTED_PACKAGE_NAME
    for smali_file in util.show_list_progress(list_of_smali_files,interactive=interactive,description="Renaming class usages in smali files"):
        try:
            with util.inplace_edit_file(smali_file) as (in_file, out_file):
                for line in in_file:
                    # Rename classes used as strings with . instead of /.
                    string_match = STRING_PATTERN.search(line)
                    if (
                            string_match
                            and string_match.group("string_value")
                            in dot_rename_transformations
                    ):
                        line = line.replace(
                            string_match.group("string_value"),
                            dot_rename_transformations[
                                string_match.group("string_value")
                            ],
                        )
                        count += 1

                    # Sometimes classes are used in annotations as strings without trailing ;
                    if (
                            string_match
                            and "{0};".format(string_match.group("string_value"))
                            in rename_transformations
                    ):
                        line = line.replace(
                            string_match.group("string_value"),
                            rename_transformations[
                                "{0};".format(string_match.group("string_value"))
                            ][:-1],
                        )
                        count += 1

                    # Rename classes used with the "classic" syntax (leading L and trailing ;).
                    class_names = CLASS_NAME_PATTERN.findall(line)
                    for class_name in class_names:
                        if class_name in rename_transformations:
                            line = line.replace(
                                class_name, rename_transformations[class_name]
                            )
                            count += 1
                    out_file.write(line)
        except:
            print("Error "+smali_file)
            pass
    return count





""" Testing function """
def rename(manifest_file, list_of_smali_files, interactive: bool = False):
    global PACKAGE_NAME
    global ENCRYPTED_PACKAGE_NAME
    global CLASS_NAME_TO_SMALI_FILE
    manifest_file = str(manifest_file).replace("/",'\\')
    manifest_file = os.getcwd() + "\\" + manifest_file
    manifest_file = manifest_file.replace('\\\\', '\\')
    print("Absolute Path: " + manifest_file)
    Xml.register_namespace(
        "android", "http://schemas.android.com/apk/res/android"
    )
    xml_parser = Xml.XMLParser(encoding="utf-8")
    manifest_tree = Xml.parse(manifest_file, parser=xml_parser)
    print("Manifest Tree: " + str(manifest_tree))
    manifest_root = manifest_tree.getroot()
    print("Manifest Root: " + str(manifest_root))
    print("Mapping Android Manifest")
    PACKAGE_NAME = manifest_root.get("package")
    print("Package Name: " + str(PACKAGE_NAME))

    if not PACKAGE_NAME:
        raise Exception(
            "Unable to extract package name from application manifest"
        )

    # Get a mapping between class name and smali file path.
    for smali_file in util.show_list_progress(
            list_of_smali_files,
            interactive=interactive,
            description="Class name to smali file mapping",
    ):
        with open(smali_file, "r", encoding="utf-8") as current_file:
            class_name = None
            for line in current_file:
                if not class_name:
                    # Every smali file contains a class.
                    class_match = CLASS_PATTERN.match(line)
                    if class_match:
                        CLASS_NAME_TO_SMALI_FILE[
                            class_match.group("class_name")
                        ] = smali_file
                        break
    transform_package_name(manifest_root)
    # Write the changes into the manifest file.
    manifest_tree.write(manifest_file, encoding="utf-8")
    xml_files: Set[str] = set(
        os.path.join(root, file_name)
        for root, dir_names, file_names in os.walk(
            "application/res"
        )
        for file_name in file_names
        if file_name.endswith(".xml")
        and (
                "layout" in root or "xml" in root
        )  # Only res/layout-*/ and res/xml-*/ folders.
    )
    xml_files.add(manifest_file)
    print("Encrypted Package Name: " + str(ENCRYPTED_PACKAGE_NAME))
    print("Done Mapping Android Manifest. \nTrying to rename classes")
    class_rename_transformations = rename_class_declarations(list_of_smali_files)
    count = rename_class_usages_in_smali(list_of_smali_files, class_rename_transformations)
    print("Total Rename: " + str(count)+ " seconds.")


