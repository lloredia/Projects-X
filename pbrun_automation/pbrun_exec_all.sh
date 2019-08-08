#!/bin/bash
 export CREDS=T3JAY2xlMTIzNAo=

: ${1?"Usage: $0 <host_list_file>"}

if [ -z ${CREDS+x} ]; then echo "$CREDS is unset"; else echo "CREDS is set to '$CREDS'"; fi

mycreds=$(echo $CREDS | base64 -d)

for host in $(cat $1); do
  echo -e "\n$host"
 ./run.exp $mycreds $host

done;
