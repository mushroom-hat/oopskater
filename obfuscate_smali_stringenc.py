import logging
import os
import re
from binascii import hexlify
from typing import List, Set

#install pycryptodome for Crypto.cipher requirements
from Crypto.Cipher import AES
from Crypto.Protocol.KDF import PBKDF2
from Crypto.Util.Padding import pad


encryption_secret = "This-key-need-to-be-32-character"
# .class <other_optional_stuff> <class_name;>  # Every class name ends with ;
classPattern = re.compile(r"\.class.+?(?P<class_name>\S+?;)", re.UNICODE)
# .locals <number>
locPattern = re.compile(r"\s+\.locals\s(?P<local_count>\d+)")
# <spaces> const-string <register>, "<string>"  # This also matches const-string/jumbo
consStrPattern = re.compile(r"\s+const-string(/jumbo)?\s(?P<register>[vp0-9]+),\s" r'"(?P<string>.+)"',re.UNICODE,)

def get_decrypt_string_smali_code(encryption_secret):
    fileName =  os.path.dirname(__file__), "resources", "smali", "DecryptString.smali"
    try:
        with open( fileName, "r", encoding="utf-8") as file:
            text = file.read()
    except Exception as e:
        print("ERROR CREATING DECRYPTOR FILE---Original File Cannot be Read at "+fileName+"\nException filed:\n"+str(e))

    #replace default enc key
    text = text.replace("This-key-need-to-be-32-character", encryption_secret)
    return text


def encrypt_string(input_string, encryption_secret):
    input_string = input_string.encode(errors="replace").decode("unicode_escape")
    key = PBKDF2(password = encryption_secret, salt = encryption_secret.encode(), dkLen=32,count=128)
    encrypted_string = hexlify(AES.new(key=key, mode=AES.MODE_ECB).encrypt(pad(input_string.encode(errors="replace"),AES.block_size))).decode()
    return encrypted_string

def encrypt(smali_file, encryption_secret):
    print("Encrypting \"" + smali_file+"\"")
    # .field <other_optional_stuff> <string_name>:Ljava/lang/String; =
    # "<string_value>"
    staticStringPattern = re.compile(r"\.field.+?static.+?(?P<string_name>\S+?):"r'Ljava/lang/String;\s=\s"(?P<string_value>.+)"',re.UNICODE,)

    try:
        encrypted_strings: Set[str] = set()
        with open(smali_file, "r", encoding="utf-8") as current_file:
            lines = current_file.readlines()

        class_name = None

        # Line numbers where a static string is declared.
        staticStringPos: List[int] = []

        # Names of the static strings.
        staticStringName: List[str] = []

        # Values of the static strings.
        staticStringVal: List[str] = []

        methodsLines = -1
        constructorPos = -1

        # Line numbers where a constant string is declared.
        string_index: List[int] = []

        # Registers containing the constant strings.
        string_register: List[str] = []

        # Values of the constant strings.
        string_value: List[str] = []

        current_local_count = 0
        for line_number, line in enumerate(lines):

            if not class_name:
                class_match = classPattern.match(line)
                if class_match:
                    class_name = class_match.group("class_name")
                    continue

            if line.startswith("# direct methods"):
                methodsLines = line_number
                continue

            if line.startswith(".method") and line.strip().endswith(
                "static constructor <clinit>()V"
            ):
                constructorPos = line_number
                continue

            static_string_match = staticStringPattern.match(line)
            if static_string_match and static_string_match.group(
                "string_value"
            ):
                # A static non empty string initialization was found.
                staticStringPos.append(line_number)
                staticStringName.append(
                    static_string_match.group("string_name")
                )
                staticStringVal.append(
                    static_string_match.group("string_value")
                )

            #check if const-string register value more than 15
            match = locPattern.match(line)
            if match:
                current_local_count = int(match.group("local_count"))
                continue

            #if using p register, must check if register + locals <15
            string_match = consStrPattern.match(line)
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

        #encrypt strings
        for string_number, index in enumerate(string_index):
            lines[index] = (
                '\tconst-string/jumbo {register}, "{enc_string}"\n'
                "\n\tinvoke-static {{{register}}}, "
                "Lcom/decryptstringmanager/DecryptString"
                ";->decryptString(Ljava/lang/String;)Ljava/lang/String;\n"
                "\n\tmove-result-object {register}\n".format(
                    register=string_register[string_number],
                    enc_string=encrypt_string(string_value[string_number],encryption_secret),
                )
            )

            encrypted_strings.add(string_value[string_number])

        # Static string encryption.
        static_string_encryption_code = ""
        for string_number, index in enumerate(staticStringPos):
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
                        staticStringVal[string_number],encryption_secret
                    ),
                    class_name=class_name,
                    string_name=staticStringName[string_number],
                )
            )

            encrypted_strings.add(staticStringVal[string_number])

        if static_string_encryption_code != "":
            if constructorPos != -1:
                # Add static string encryption to the existing static constructor.
                local_match = locPattern.match(
                    lines[constructorPos + 1]
                )
                if local_match:
                    # At least one register is needed.
                    local_count = int(local_match.group("local_count"))
                    if local_count == 0:
                        lines[constructorPos + 1] = "\t.locals 1\n"
                    lines[constructorPos + 2] = "\n{0}".format(
                        static_string_encryption_code
                    )
            else:
                # Add a new static constructor for the static string encryption.
                if methodsLines != -1:
                    new_constructor_line = methodsLines
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

            # # encryption_secret = obfuscation_info.encryption_secret
            # obfuscationDecryptflag = False;
            # if (
            #         not obfuscationDecryptflag and encrypted_strings
            # ):
            #     # Add to the app the code for decrypting the encrypted strings. The code
            #     # for decrypting can be put in any smali directory, since it will be
            #     # moved to the correct directory when rebuilding the application.
            #     destination_dir = os.path.dirname(smali_file)
            #     destination_file = os.path.join(destination_dir, "DecryptString.smali")
            #     with open(
            #             destination_file, "w", encoding="utf-8"
            #     ) as decrypt_string_smali:
            #         decrypt_string_smali.write(
            #             get_decrypt_string_smali_code(encryption_secret)
            #         )
            #         # obfuscationDecryptflag = True
        if(len(encrypted_strings)!=0):
            print("\n"+str(len(encrypted_strings))+" strings encrypted in \""+smali_file+"\"")
            return 1
    except Exception as e:
        print(
            'Error during execution of "{0}" obfuscator: {1}')
        raise

#encrypt("application/smali_classes3/com/example/myapplication/BuildConfig.smali", "This-key-need-to-be-32-character")

