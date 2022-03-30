import os
import shutil
import glob


def backup_files(list_of_files):
    backup_path = os.getcwd() + '\\diffviewer\\bak\\'

    files = glob.glob(backup_path + '/*')
    for f in files:
        try:
            os.remove(f)
        except OSError as e:
            print("Error: %s : %s" % (f, e.strerror))

    for file in list_of_files:
        src = str(file)
        dst = backup_path + str(file.split('\\')[-1])
        shutil.copy(src, dst, follow_symlinks=False)


def generate_new_files(list_of_files):
    new_path = os.getcwd() + '\\diffviewer\\new\\'
    files = glob.glob(new_path + '/*')
    for f in files:
        try:
            os.remove(f)
        except OSError as e:
            print("Error: %s : %s" % (f, e.strerror))

    for file in list_of_files:
        src = str(file)
        dst = new_path + str(file.split('\\')[-1])
        shutil.copy(src, dst, follow_symlinks=False)
