#!/bin/bash

result=""

while IFS= read -r pid;
do
    if [ ! -d "/proc/$pid" ]; then
        continue
    fi
    ppid=$(awk '{if ($1 == "PPid:") print $2}' /proc/$pid/status)
    ser=$(awk '{if ($1 == "se.sum_exec_runtime") print $3}' /proc/$pid/sched)
    nrs=$(awk '{if ($1 == "nr_switches") print $3}' /proc/$pid/sched)
    art=$(bc<<<"scale=6;$ser/$nrs")
    result+="$pid $ppid $art"
    result+=$'\n'

done <<< "$(ls /proc | awk '/^[0-9]+$/')"

echo "$result" | sort -nk2 | awk '{printf "ProcessID=%d : Parent_ProcessID=%d : Average_Running_Time=%f \n", $1, $2, $3}' > res04
