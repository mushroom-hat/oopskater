import re

########################################################################################
#                                Common regex patterns.                                #
########################################################################################
from contextlib import contextmanager

LOCALS_PATTERN = re.compile(r"\s+\.locals\s(?P<local_count>\d+)")
# .class <other_optional_stuff> <class_name;>  # Every class name ends with ;
CLASS_PATTEN = re.compile(r"\.class.+?(?P<class_name>\S+?;)", re.UNICODE)
# L<class_name>;  # Every class name starts with L and ends with ;
CLASS_NAME_PATTEN = re.compile(r"L[^():\s]+?;", re.UNICODE)
# .method <other_optional_stuff> <method_name>(<param>)<return_type>

METHOD_PATTEN = re.compile(
    r"\.method.+?(?P<method_name>\S+?)"
    r"\((?P<method_param>\S*?)\)"
    r"(?P<method_return>\S+)",
    re.UNICODE,
)

# .field <other_optional_stuff> <field_name>:<field_type> <optional_initialization>
FIELD_PATTERN = re.compile(
    r"\.field.+?(?P<field_name>\S+?):" r"(?P<field_type>\S+)", re.UNICODE
)

# <spaces> <usage_type> <param>, <field_object>-><field_name>:<field_type>
FIELD_USAGE_PATTEN = re.compile(
    r"\s+(?P<usage_type>[is](get|put)\S*)\s"
    r"(?P<field_param>[vp0-9,\s]+),\s"
    r"(?P<field_object>\S+?)"
    r"->(?P<field_name>\S+?):"
    r"(?P<field_type>\S+)",
    re.UNICODE,
)

TYPE_DICT = {
            "I": "Ljava/lang/Integer;",
            "Z": "Ljava/lang/Boolean;",
            "B": "Ljava/lang/Byte;",
            "S": "Ljava/lang/Short;",
            "J": "Ljava/lang/Long;",
            "F": "Ljava/lang/Float;",
            "D": "Ljava/lang/Double;",
            "C": "Ljava/lang/Character;",
        }

SGET_DICT = {
            "I": "Ljava/lang/Integer;->TYPE:Ljava/lang/Class;",
            "Z": "Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;",
            "B": "Ljava/lang/Byte;->TYPE:Ljava/lang/Class;",
            "S": "Ljava/lang/Short;->TYPE:Ljava/lang/Class;",
            "J": "Ljava/lang/Long;->TYPE:Ljava/lang/Class;",
            "F": "Ljava/lang/Float;->TYPE:Ljava/lang/Class;",
            "D": "Ljava/lang/Double;->TYPE:Ljava/lang/Class;",
            "C": "Ljava/lang/Character;->TYPE:Ljava/lang/Class;",
        }

CAST_DICT = {
            "I": "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;",
            "Z": "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;",
            "B": "Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;",
            "S": "Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;",
            "J": "Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;",
            "F": "Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;",
            "D": "Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;",
            "C": "Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;",
        }

REVERSE_CAST_DICT = {
            "I": "Ljava/lang/Integer;->intValue()I", "Z": "Ljava/lang/Boolean;->booleanValue()Z",
            "B": "Ljava/lang/Byte;->byteValue()B", "S": "Ljava/lang/Short;->shortValue()S",
            "J": "Ljava/lang/Long;->longValue()J", "F": "Ljava/lang/Float;->floatValue()F",
            "D": "Ljava/lang/Double;->doubleValue()D", "C": "Ljava/lang/Character;->charValue()C",
        }


# <spaces> invoke-<type> {<passed_param>}, <class_name>-><method>(<param>)<return_type>
INVOKE_PATTERN = re.compile(
    r"\s+(?P<invoke_type>invoke-\S+)\s"
    r"{(?P<invoke_pass>[vp0-9,.\s]*)},\s"
    r"(?P<invoke_object>\S+?)"
    r"->(?P<invoke_method>\S+?)"
    r"\((?P<invoke_param>\S*?)\)"
    r"(?P<invoke_return>\S+)",
    re.UNICODE,
)