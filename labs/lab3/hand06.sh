#!/bin/bash

echo $$ > .pid
mode=""
result=1

add() {
    mode="+"
}

multiply() {
    mode="*"
}

stop() {
	echo "stop"
	exit 0
}

trap add USR1
trap multiply USR2
trap stop SIGTERM

while true; do
	case $mode in
        "+")
            result=$((result + 2))
            echo "result: $result"
            ;;
        "*")
			result=$((result * 2))
            echo "result: $result"
            ;;
    esac
    sleep 1
done
