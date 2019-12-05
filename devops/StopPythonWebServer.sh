#!/bin/bash

PID=python

#kill any process running
ps -aux | grep python | grep -v grep | awk '{print $2}' | xargs kill
   sleep 2
echo $PID was TERMINATED
~
~
