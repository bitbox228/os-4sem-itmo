#!/bin/bash

mem_pid=$(cat .pid)
mem2_pid=$(cat .pid2)
echo "" > top2.log

while true
do
    top=$(top -b -n 1)
    mem_proc=$(awk -v pid="$mem_pid" '$1 == pid' <<< "$top")
    mem2_proc=$(awk -v pid="$mem2_pid" '$1 == pid' <<< "$top")
    if [ -z "$mem_proc" ] && [ -z "$mem2_proc" ]; then
        break
    fi
    date >> top2.log
    echo "$top" | head -n 7 | tail -n 4 >> top2.log
    if [[ -n "$mem_proc" ]]; then
        echo "$mem_proc" >> top2.log
    fi
    if [[ -n "$mem2_proc" ]]; then
        echo "$mem2_proc" >> top2.log
    fi
    echo "" >> top2.log
    echo "$top" | head -n 12 | tail -n 5 >> top2.log
    echo "" >> top.log
    sleep 1
done