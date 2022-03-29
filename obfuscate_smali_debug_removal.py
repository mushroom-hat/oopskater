import re


def add_debug_algorithm(file):
    try:
        pattern = r'.line [0-9]*'
        with open(file, "r+", encoding="utf-8") as in_file:
            content = in_file.readlines()
            content = [line for line in content]

            new_content = []
            for item in content:
                mod_string = re.sub(pattern, '', item)
                new_content.append(mod_string)
            content = "".join(list(filter(lambda x: x != "", new_content)))
            in_file.seek(0)
            in_file.write(content)
            in_file.truncate()
            return 1
    except:
        return 0
