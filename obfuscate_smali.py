
import threading

# Import custom function
import obfuscate_smali_nop
import obfuscate_smali_goto
import obfuscate_smali_debug_removal
from queue import Queue

NOP_REPLACEMENT_COUNT = 0

def remove_new_line(file):
    with open(file, "r+") as in_file:
        content = in_file.readlines()
        content = [line for line in content]
        content = [line.replace('\n', '') for line in content]
        content = "".join(list(filter(lambda x: x != "", content)))
        in_file.seek(0)
        in_file.write(content)
        in_file.truncate()



def threader(my_queue):
    # This function will get the item from the queue and run the function add_nop_in_method()
    global NOP_REPLACEMENT_COUNT
    while True:
        file = my_queue.get()
        status = obfuscate_smali_nop.add_nop_in_method(file)
        if (status):
            NOP_REPLACEMENT_COUNT += 1

        #obfuscate_smali_debug_removal.debugRemoval(file)
        # remove_new_line(item[FILE])
        my_queue.task_done()


def change_all_file(smali_file_list, file_list_size):
    """Add the nop in all the smali class file"""
    """Whack all the function haha"""
    my_queue = Queue()
    # This function will create the worker/threads
    for x in range(100):
        t = threading.Thread(target=threader, args=(my_queue,))
        t.daemon = True
        t.start()

    print("Total Number of Files to Scan: " + str(file_list_size))
    print("Average waiting time: " + str((file_list_size / 60) / 2) + " seconds.")
    print("Generating Junk NOP...")

    my_file = open('file_list.txt', 'w')
    for item in smali_file_list:
        my_file.write(item + '\n')
    my_file.close

    for smali_file in smali_file_list:  # For each file
        my_queue.put(smali_file)
        # remove_new_line(smali_file)
    my_queue.join()
    print("Total Number of files with generated NOP: " + str(NOP_REPLACEMENT_COUNT))
    print("Removing all new lines...")


    goto_count = 0
    print("Adding Goto statements....")
    for smali_file in smali_file_list:
        if (obfuscate_smali_goto.add_goto(smali_file)):
            goto_count += 1
    print("Total files added with goto statement: " + str(goto_count))



