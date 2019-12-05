#!/bin/bash
#set-x
#pass with {file < hosts}
while read host; do
   scp $1 ${host}:
done


