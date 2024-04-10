#!/bin/bash

while true; do
    read -r input
    input=$(echo "$input")

    case $input in
        "+")
            kill -USR1 $(cat .pid)
            ;;
        "*")
            kill -USR2 $(cat .pid)
            ;;
        "TERM")
            kill -SIGTERM $(cat .pid)
            echo "stop"
            exit
            ;;
        *)
            ;;
    esac
done
