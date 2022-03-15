import logging
import os
import re
from binascii import hexlify
from typing import List, Set

from Crypto.Cipher import AES
from Crypto.Protocol.KDF import PBKDF2
from Crypto.Util.Padding import pad

#from obfuscapk import obfuscator_category
from obfuscapk import util
#from obfuscapk.obfuscation import



def encrypt_string(input_string: str):
    input_string = input_string.encode(errors="replace").decode("unicode_escape")
    key = PBKDF2(password = encryption_secret, salt = encryption_secret.encode(), dkLen=32,count=128)
    encrypted_string = hexlify(AES.new(key=key, mode=AES.MODE_ECB).encrypt(pad(input_string.encode(errors="replace"),AES.block_size))).decode()
    return encrypted_string

def obfuscateEnc(smali_file):
    encryption_secret = "This-key-need-to-be-32-character"
    encrypted_strings: Set[str] = set()
    #print('Running "{0}" obfuscator'.format(self.__class__.__name__))
    print('Encrypting constant strings in file "{0}"'.format(smali_file))

    # .field <other_optional_stuff> <string_name>:Ljava/lang/String; =
    # "<string_value>"
    static_string_pattern = re.compile(
        r"\.field.+?static.+?(?P<string_name>\S+?):"
        r'Ljava/lang/String;\s=\s"(?P<string_value>.+)"',
        re.UNICODE,
    )
    with open(smali_file, "r", encoding="utf-8") as current_file:
        lines = current_file.readlines()

    class_name = None
    # Static strings positions.
    static_string_index: List[int] = []

    # Static string names.
    static_string_name: List[str] = []

    # Static string values.
    static_string_value: List[str] = []

    direct_methods_line = -1
    static_constructor_line = -1

    # Constant string positions.
    string_index: List[int] = []

    # Registers containing the constant strings.
    string_register: List[str] = []

    # Values of the constant strings.
    string_value: List[str] = []

    current_local_count = 0
    for line_number, line in enumerate(lines):

        if not class_name:
            class_match = util.class_pattern.match(line)
            if class_match:
                class_name = class_match.group("class_name")
                continue

        if line.startswith("# direct methods"):
            direct_methods_line = line_number
            continue

        if line.startswith(".method") and line.strip().endswith(
            "static constructor <clinit>()V"
        ):
            static_constructor_line = line_number
            continue

        static_string_match = static_string_pattern.match(line)
        if static_string_match and static_string_match.group("string_value"):
            # A static non empty string initialization was found.
            static_string_index.append(line_number)
            static_string_name.append(
                static_string_match.group("string_name")
            )
            static_string_value.append(
                static_string_match.group("string_value")
            )

            #check if register count exceeds 15 (>15 no encrypt)
            match = util.locals_pattern.match(line)
            if match:
                current_local_count = int(match.group("local_count"))
                continue

            #if string has parameter regisster, check if register n + locals <=15
            string_match = util.const_string_pattern.match(line)
            if string_match and string_match.group("string"):
                reg_type = string_match.group("register")[:1]
                reg_number = int(string_match.group("register")[1:])
                if (reg_type == "v" and reg_number <= 15) or (
                    reg_type == "p" and reg_number + current_local_count <= 15
                ):
                    # A non empty string was found in a register <= 15.
                    string_index.append(line_number)
                    string_register.append(string_match.group("register"))
                    string_value.append(string_match.group("string"))

        #Encrypt constant string_register
        for string_number, index in enumerate(string_index):
            lines[index] = (
                '\tconst-string/jumbo {register}, "{enc_string}"\n'
                "\n\tinvoke-static {{{register}}}, "
                "Lcom/decryptstringmanager/DecryptString"
                ";->decryptString(Ljava/lang/String;)Ljava/lang/String;\n"
                "\n\tmove-result-object {register}\n".format(
                    register=string_register[string_number],
                    enc_string=encrypt_string(string_value[string_number]),
                )
            )

            encrypted_strings.add(string_value[string_number])

        #Encrypt static strings
        static_string_encryption_code = ""
        for string_number, index in enumerate(static_string_index):
            # Remove the original initialization.
            lines[index] = "{0}\n".format(lines[index].split(" = ")[0])

            # Initialize the static string from an encrypted string.
            static_string_encryption_code += (
                '\tconst-string/jumbo v0, "{enc_string}"\n'
                "\n\tinvoke-static {{v0}}, "
                "Lcom/decryptstringmanager/DecryptString"
                ";->decryptString(Ljava/lang/String;)Ljava/lang/String;\n"
                "\n\tmove-result-object v0\n"
                "\n\tsput-object v0, {class_name}->"
                "{string_name}:Ljava/lang/String;\n\n".format(
                    enc_string=encrypt_string(
                        static_string_value[string_number]
                    ),
                    class_name=class_name,
                    string_name=static_string_name[string_number],
                )
            )

            encrypted_strings.add(static_string_value[string_number])

        if static_string_encryption_code != "":
            if static_constructor_line != -1:
                # Add static string encryption to the existing static constructor.
                local_match = util.locals_pattern.match(
                    lines[static_constructor_line + 1]
                )
                if local_match:
                    # At least one register is needed.
                    local_count = int(local_match.group("local_count"))
                    if local_count == 0:
                        lines[static_constructor_line + 1] = "\t.locals 1\n"
                    lines[static_constructor_line + 2] = "\n{0}".format(
                        static_string_encryption_code
                    )
            else:
                # Add a new static constructor for the static string encryption.
                if direct_methods_line != -1:
                    new_constructor_line = direct_methods_line
                else:
                    new_constructor_line = len(lines) - 1

                lines[new_constructor_line] = (
                    "{original}"
                    ".method static constructor <clinit>()V\n"
                    "\t.locals 1\n\n"
                    "{encryption_code}"
                    "\treturn-void\n"
                    ".end method\n\n".format(
                        original=lines[new_constructor_line],
                        encryption_code=static_string_encryption_code,
                    )
                )

        with open(smali_file, "w", encoding="utf-8") as current_file:
            current_file.writelines(lines)

