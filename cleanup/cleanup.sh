#!/bin/bash

# Escape code
esc=`echo -en "\033"`

# Set colors
cc_red="${esc}[0;31m"
cc_green="${esc}[0;32m"
cc_yellow="${esc}[0;33m"
cc_blue="${esc}[0;34m"
cc_normal=`echo -en "${esc}[m\017"`

for host in $(cat SERVERLIST.txt); do
  echo -e "\n${cc_green}$host${cc_normal}"
  H_NAME=$(ssh -q $host cat /etc/motd | grep -i func | awk '{print $3 " " $4 " " $5 " " $6}')
  NOFILE=$(ssh -q $host ls -altr /var/tmp)
  echo -e "${cc_green}$H_NAME${cc_normal}"
  echo -e "${cc_yellow}file: \t${cc_normal}$NOFILE"
done;
