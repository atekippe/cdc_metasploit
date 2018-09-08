#!/usr/bin/python3
'''
This script will update the LHOST on my Metasploit Resource files.  Yes, I'm lazy....
'''

import os
import netifaces as ni

# Declare some colors to use
green = '\033[92m'
yellow = '\033[93m'
red = '\033[91m'
blue = '\033[94m'
end_color = '\033[0m'

# I'm lazy tell me the available IP Addresses
interfaces = ni.interfaces()
print(green + "\n ***** Addresses available for LHOST: ***** \n" + end_color)
for interface in interfaces:
    print(blue + "{0} - ".format(interface) + (ni.ifaddresses(interface)[ni.AF_INET][0]['addr']) + end_color)

# Get the LHOST IP Address
lhost = input("\n" + green + "LHOST IP ADDRESS: " + end_color)

# Get the working directory & create vars for the template and finished files
wd = os.getcwd()
template_directory = wd + "/template/"
ready_to_hack_directory = wd + "/ready_to_hack/"

# Get the files to a var
files_in_dir = os.listdir(template_directory)

# Grab the files in the directory
for file in files_in_dir:
    # find the Ruby Files
    if '.rb' in file:
        rb_template = template_directory + file

        try:
            print(yellow + "\n ***** Updating {0} *****".format(file) + end_color)
            # Open the template files to read and the finished files to write
            f_template = open(template_directory + file)
            f_updated = open(ready_to_hack_directory + file, 'w+')

            # Update the $LHOST$ line with the var lhost from above
            for line in f_template:
                line = line.replace('$LHOST$', lhost)
                f_updated.write(line)

            f_template.close()
            f_updated.close()

            print(yellow + "\n ***** Updated {0} *****".format(file) + end_color)

        except IOError as e:
            print("Error - Unable to open the reverse python template:"), e

print(green + "\n ***** Ready to Hack!!! resource -r {0} + filename *****".format(ready_to_hack_directory) + end_color)
