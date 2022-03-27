import common_regex_pattern
import util

def add_goto(smali_file):
    try:
        with util.inplace_edit_file(smali_file) as (in_file, out_file):
            editing_method = False
            for line in in_file:
                """ Put a "goto" to the label at the finish of the method and 
                a label to the method's first instruction at the start of a 
                non abstract/native method (following the.locals instruction). """
                if (
                        line.startswith(".method ")
                        and " abstract " not in line
                        and " native " not in line
                        and not editing_method
                ):
                    out_file.write(line)
                    editing_method = True

                elif editing_method and common_regex_pattern.LOCALS_PATTERN.match(line):
                    out_file.write(line)
                    out_file.write("\n\tgoto/32 :after_last_instruction\n\n")
                    out_file.write("\t:before_first_instruction\n")

                elif line.startswith(".end method") and editing_method:
                    """ Insert a label after the final instructions of the method and a "goto" to 
                    a label at the beginning of the method if at the end of the method. 
                    This will not result in an infinite loop since the method will resume at a certain point and 
                    the subsequent "goto" will not be called again after the method is completed. """

                    out_file.write("\n\t:after_last_instruction\n\n")
                    out_file.write("\tgoto/32 :before_first_instruction\n\n")
                    out_file.write(line)
                    editing_method = False

                else:
                    out_file.write(line)
        return 1
    except:
        return 0