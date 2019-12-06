#!/bin/bash

echo -ne '#####                     (33%)\r'
sleep 2
echo -ne '#############             (66%)\r'
sleep 2
echo -ne '#######################   (100%)\r'
echo -ne '\n'

sleep 1

nohup python -m SimpleHTTPServer >/dev/null 2>&1 &

sleep 2

echo -e "[+] Python Web-Server Is Up and Running... "
