#!/bin/bash

#create generated keys 
ssh-keygen -t ecdsa -b 256 -f mykey -N ''

#copy keys to wanted servers 
for hostname in $(cat $1); do
  ssh-copy-id $(whoami)@$hostname
done;
