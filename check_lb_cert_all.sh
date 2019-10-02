#!/bin/bash

# takes a list of hostname:port from a flat file and checks ssl certs
#


# like debugging? Uncomment below
set -x

: ${1?"Usage: $0 <raw_hosts_port_list>"}

read -p "Specify prefix for report files [UI/LB/MTE/anyotherstring]: " name_prefix

for line in $(cat $1); do
        host=`echo $line | awk -F ':' '{print $1}'`
        port=`echo $line | awk -F ':' '{print $2}'`
        echo -e "[.] Getting ssl cert for ######  $host ##### ...\n"
        openssl s_client -showcerts -connect "$host:$port" <<< "Q" > "CERT-$name_prefix-$(date +%Y-%m-%d_%H:%M:%S).$host$port.out" 2>&1
done




#needs raw_hosts_port_list.txt to function
