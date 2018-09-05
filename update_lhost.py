#!/usr/bin/python3
import os

wd = os.getcwd()
template_directory = wd + "/template/"
ready_to_hack_directory = wd + "/ready_to_hack/"

# Get the files to a var
files_in_dir = os.listdir()

# Grab the files in the directory
for file in files_in_dir:
    # find the Ruby Files
    if '.rb' in file:

        try:
            rb_template = template_directory + file
            print(rb_template)
        except IOError as e:
            print("Error - Unable to open the reverse python template:"), e

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