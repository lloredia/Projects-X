#!/bin/bash
for i in $(cat $1); do
  curl http://depot.artifactory.com:8080 | grep $i
done;
