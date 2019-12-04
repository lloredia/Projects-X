#!/bin/bash
echo "input: "
read input

echo "searching file with this pattern '${input}' under present directory"
array=(`find . -name '*'${input}'*'`)

for i in "${array[@]}"
do :
    echo $i
done
~
~
~
