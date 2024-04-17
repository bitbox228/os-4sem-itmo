#!/bin/bash

locked=false
cur_pid=""
queue=()

mkfifo pipe

while true; do
	read -r command pid < pipe
	
	if $locked; then
		if [[ $pid -eq cur_pid ]] && [[ "$command" = "unlock" ]]; then
			locked=false
			kill -USR2 "$cur_pid"
			cur_pid=""
			if [[ ${#queue[@]} -gt 0 ]]; then
				locked=true
				cur_pid=${queue[0]}
				queue=("${queue[@]:1}")
				kill -USR1 "$cur_pid"
			fi
		elif [[ "$command" = "lock" ]]; then
			queue+=("$pid")
		fi
	else 
		if [[ "$command" = "lock" ]]; then
			locked=true
			cur_pid="$pid"
			kill -USR1 "$cur_pid"
		fi
	fi
	
done