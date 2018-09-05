#!/usr/bin/python3
import os

# Get the files to a var
files_in_dir = os.listdir()


for i in files_in_dir:
    if '.rb' in i:
        print(i)


'''
# Shell to do this
try:
    # open the python reverse shell template
    python_reverse = open(template_directory + "/rev.py")
    python_reverse_updated = open(apache_directory + "/rev_py_ip.py", 'w+')
    for py_line in python_reverse:
        py_line = py_line.replace('$WEB_SERVER$', web_server_ip)
        python_reverse_updated.write(py_line)
    python_reverse_updated.close()
    print("Created Reverse Python Script! - " + apache_directory + "/rev_py_ip.py")
'''