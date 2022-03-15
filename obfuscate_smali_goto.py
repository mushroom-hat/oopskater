import re
import logging
import util

def add_goto(smali_file):
    try:
        with util.inplace_edit_file(smali_file) as (in_file, out_file):
            editing_method = False
            for line in in_file:
                if (
                        line.startswith(".method ")
                        and " abstract " not in line
                        and " native " not in line
                        and not editing_method
                ):
                    # If at the beginning of a non abstract/native method
                    # (after the .locals instruction), insert a "goto" to the
                    # label at the end of the method and a label to the first
                    # instruction of the method.
                    out_file.write(line)
                    editing_method = True

                elif editing_method and util.LOCALS_PATTERN.match(line):
                    out_file.write(line)
                    out_file.write("\n\tgoto/32 :after_last_instruction\n\n")
                    out_file.write("\t:before_first_instruction\n")

                elif line.startswith(".end method") and editing_method:
                    # If at the end of the method, insert a label after the
                    # last instruction of the method and a "goto" to the label
                    # at the beginning of the method. This will not cause an
                    # endless loop because the method will return at some point
                    # and the second "goto" won't be called again when the
                    # method finishes.
                    out_file.write("\n\t:after_last_instruction\n\n")
                    out_file.write("\tgoto/32 :before_first_instruction\n\n")
                    out_file.write(line)
                    editing_method = False

                else:
                    out_file.write(line)
        return 1
    except:
        return 0