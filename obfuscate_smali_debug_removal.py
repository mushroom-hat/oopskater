def debugRemoval(file):
    with open(file, "r+") as in_file:
        content = in_file.readlines()
        content = [line for line in content]
        content = [line.replace('.line', '') for line in content]
        content = "".join(list(filter(lambda x: x != "", content)))
        in_file.seek(0)
        in_file.write(content)
        in_file.truncate()