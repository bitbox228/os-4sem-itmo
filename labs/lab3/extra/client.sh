#!/bin/bash

status="unlocked"

lock() {
	status="locked"
}

unlock() {
	status="unlocked"
}

quit() {
    while true; do
        if [ "$status" = "locked" ]; then
            status="unlocked_wait"
            echo "unlock $$" > pipe
        elif [ "$status" = "unlocked" ]; then
            exit 0
        fi 
    done
}

trap lock USR1
trap unlock USR2
trap quit SIGINT

while true; do
	read -r input
	
	case $input in
        "lock")
            if [ "$status" = "unlocked" ]; then
            	status="locked_wait"
            	echo "lock $$" > pipe
            else 
            	echo "no"
            fi
            ;;
        "unlock")
            if [ "$status" = "locked" ]; then
            	status="unlocked_wait"
            	echo "unlock $$" > pipe
            else 
            	echo "no"
            fi
            ;;
        "quit")
            echo "quit"
            exit
            ;;
        "status")
            echo "$status"
            ;;
        *)
            echo "no"
            ;;
    esac
done