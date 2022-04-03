import os
import shutil
import glob


def backup_files(list_of_files):
    """ This will back up a list of files given,
    it will be used to compare the difference between the before and after. """
    backup_path = os.getcwd() + '\\diffviewer\\bak\\'
    new_path = os.getcwd() + '\\diffviewer\\new\\'

    files = glob.glob(backup_path + '/*')
    for f in files:
        try:
            os.remove(f)
        except OSError as e:
            print("Error: %s : %s" % (f, e.strerror))

    files = glob.glob(new_path + '/*')
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
    """ This will generate a list of new files after obfuscation, to show the difference,
    that will be used by the pydiff GUI."""
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


def check_dir():
    path = os.getcwd()

    new_path = path + '\\diffviewer\\new'
    print(new_path)
    isExist = os.path.exists(new_path)
    if not isExist:
        os.makedirs(new_path)
        print("The new directory is created!")


    bak_path = path + '\\diffviewer\\bak'
    print(bak_path)
    # Check whether the specified path exists or not
    isExist_bak = os.path.exists(bak_path)
    if not isExist_bak:
        os.makedirs(bak_path)
        print("The bak directory is created!")