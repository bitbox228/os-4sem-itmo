#!/bin/bash

mem_pid=$(cat .pid)
echo "" > top.log

while true
do
    top=$(top -b -n 1)
    mem_proc=$(awk -v pid="$mem_pid" '$1 == pid' <<< "$top")
    if [ -z "$mem_proc" ]; then
        break
    fi
    date >> top.log
    echo "$top" | head -n 7 | tail -n 4 >> top.log
    echo "$mem_proc" >> top.log
    echo "$top" | head -n 12 | tail -n 5 >> top.log
    echo "" >> top.log
    sleep 1
done