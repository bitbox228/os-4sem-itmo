#!/bin/bash

declare -a rchar

while IFS= read -r pid;
do
	if [ ! -d "/proc/$pid" ]; then
		continue
	fi
	rchar[$pid]=$(awk '{if ($1 == "rchar:") print $2}' "/proc/$pid/io")

done <<< "$(ls /proc | awk '/^[0-9]+$/')"

sleep 60

declare -a rchar_res

while IFS= read -r pid;
do
	if [ ! -d "/proc/$pid" ]; then
		continue
	fi
	rchar_res[$pid]=$(($(awk '{if ($1 == "rchar:") print $2}' "/proc/$pid/io") - rchar[$pid]))

done <<< "$(ls /proc | awk '/^[0-9]+$/')"

for pid in ${!rchar_res[@]}; do
	cmdline=$(awk '{print $0}' "/proc/$pid/cmdline")
	echo "$pid:$cmdline:${rchar_res[pid]}"
done | sort --field-separator=: -rnk3 | head --lines=3 > res07
