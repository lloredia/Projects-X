#!/bin/bash

header()  { echo -e "\n\033[1m$@\033[0m"; }
success() { echo -e " \033[1;32mâœ”\033[0m  $@"; }
error()   { echo -e " \033[1;31mâœ–\033[0m  $@"; }
arrow()   { echo -e " \033[1;34mâžœ\033[0m  $@"; }

##################################
# Add color output to your script#
##################################

black()     { echo "$(tput setaf 0)$*$(tput setaf 9)"; }
red()       { echo "$(tput setaf 1)$*$(tput setaf 9)"; }
green()     { echo "$(tput setaf 2)$*$(tput setaf 9)"; }
yellow()    { echo "$(tput setaf 3)$*$(tput setaf 9)"; }
blue()      { echo "$(tput setaf 4)$*$(tput setaf 9)"; }
magenta()   { echo "$(tput setaf 5)$*$(tput setaf 9)"; }
cyan()      { echo "$(tput setaf 6)$*$(tput setaf 9)"; }
white()     { echo "$(tput setaf 7)$*$(tput setaf 9)"; }

#
# Usage

#black   "This is black text"
#red     "This is red text"
#green   "This is green text"
#yellow  "This is yellow text"
#blue    "This is blue text"
#magenta "This is magenta text"
#cyan    "This is cyan text"
#white   "This is white text"

magenta "[+] Copying .bashrc to host..."

ssh_key=' ~/.ssh/mykey.pub'
: ${2?"Usage: $0 <host_list_filename> <.bashrc>"}

cp $2 .bashrc 2> /dev/null

for host in $(cat $1); do
  scp -q -i $ssh_key .bashrc $host:~/.bashrc;
done

green "[OK]"
