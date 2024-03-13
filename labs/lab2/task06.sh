#!/bin/bash

max_vmrss=""
max_pid=""

while IFS= read -r pid;
do
    if [ ! -d "/proc/$pid" ]; then
        continue
    fi
    vmrss=$(awk '{if ($1 == "VmRSS:") print $2}' /proc/$pid/status)
	if [[ $max_pid = "" ]] || [[ $vmrss -gt $max_vmrss ]];
	then
		max_vmrss=$vmrss
		max_pid=$pid
	fi

done <<< "$(ls /proc | awk '/^[0-9]+$/')"

echo "$max_pid"
