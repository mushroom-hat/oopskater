import os
import shutil
import glob


def backup_files(list_of_files):
    backup_path = os.getcwd() + '\\diffviewer\\bak\\'
    files = glob.glob(backup_path)
    if len(files) > 1:
        for f in files:
            os.remove(f)

    for file in list_of_files:
        src = str(file)
        dst = backup_path + str(file.split('\\')[-1])
        # print(src, "<====> ", dst)
        shutil.copy(src, dst, follow_symlinks=False)


def generate_new_files(list_of_files):
    new_path = os.getcwd() + '\\diffviewer\\new\\'
    files = glob.glob(new_path)
    if len(files) > 1:
        for f in files:
            os.remove(f)

    for file in list_of_files:
        src = str(file)
        dst = new_path + str(file.split('\\')[-1])
        # print(src, "<====> ", dst)
        shutil.copy(src, dst, follow_symlinks=False)