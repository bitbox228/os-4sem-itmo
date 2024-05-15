#!/bin/bash

echo $$ > .pid
echo "" > report.log

arr=()
k=0

while true
do
    arr+=(1 2 3 4 5 6 7 8 9 10)
    ((k++))
    if [[ $((k % 100000)) -eq 0 ]]; then
        echo "${#arr[@]}" >> report.log
    fi
done