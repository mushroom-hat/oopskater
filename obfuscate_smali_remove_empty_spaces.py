

def remove_new_line(file):
    with open(file, "r+") as in_file:
        content = in_file.readlines()
        content = [line for line in content]
        content = [line.replace('\n', '') for line in content]
        content = list(filter(lambda x: x != "", content))
        # content = [x.strip(' ') for x in content]
        # new_content = []
        # for item in content:
        #     if '{' in item:
        #         index = item.index('{')
        #         new_content.append(item[:index])
        #         new_content.append('{')
        #         if (item[index+1:]):
        #             new_content.append(item[index+1:])
        #     else:
        #         new_content.append(item)

        in_file.seek(0)
        in_file.write(' '.join(content))
        in_file.truncate()


