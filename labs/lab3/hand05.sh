#!/bin/bash

mode="+"
result=1

read generator_pid < pipe

while true; do
    read -r line < pipe

    case $line in
        "+")
            mode="+"
            echo "+ mode"
            ;;
        "*")
            mode="*"
            echo "* mode"
            ;;
        "QUIT")
            echo "quit"
            kill "$generator_pid"
            rm pipe
            exit 0
            ;;
        *[!0-9]*|"")
            echo "error"
            kill "$generator_pid"
            rm pipe
            exit 1
            ;;
        *)
            if [ "$mode" = "+" ]; then
                result=$((result + line))
            else
                result=$((result * line))
            fi
            echo "result: $result"
            ;;
    esac
done
