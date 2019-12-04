#!/bin/bash

: ${1?"Usage: $0 <know_host.txt>"}

for host in $(cat $1); do
  echo -e "\n$host"

echo "-------------- Pre build checks: --------------"
# ssh -q lloredia@$host cat /etc/motd | grep -i func
# ssh -q lloredia@$host ls -larht /u01/software
# ssh -q lloredia@$host ls -al /etc/chef/client.pem;
# ssh -q lloredia@$host which pbrun

# ssh -q lloredia@$host
# ssh -q lloredia@$host
# ssh -q lloredia@$host
# ssh -q lloredia@$host


  echo "-------------- Network info: --------------"
# ssh -q lloredia@$host netstat -tln | grep
# ssh -q lloredia@$host ps -aux | grep
# ssh -q lloredia@$host
# ssh -q lloredia@$host
# ssh -q lloredia@$host


  echo "-----------------Pkg install: ---------------"

# ssh -q lloredia@$host touch yum_pkg_install.sh
# ssh -q lloredia@$host chmod 755 yum_pkg_install.sh
# ssh -q lloredia@$host rpm -qa | grep binutil;
# ssh -q lloredia@$host
# ssh -q lloredia@$host
# ssh -q lloredia@$host


 echo "-----------------??????????? ---------------"
# ssh -q lloredia@$host cat /etc/*release | grep -i pretty;
# ssh -q lloredia@$host uname -a;
# ssh -q lloredia@$host cat /proc/cpuinfo | grep -i proc | wc -l
# ssh -q lloredia@$host free -h
# ssh -q lloredia@$host cat /etc/motd | grep -i func;
# ssh -q lloredia@$host ulimit -n
# ssh -q lloredia@$host df -h /u01
# ssh -q lloredia@$host
# ssh -q lloredia@$host
# ssh -q lloredia@$host
# ssh -q lloredia@$host




done;
~
~
~
