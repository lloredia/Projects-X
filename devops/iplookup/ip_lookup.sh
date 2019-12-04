#!/bin/bash
for HOST in $(cat /home/lloredia/devops/known_host.txt); do
nslookup $HOST;
done;
