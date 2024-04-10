#!/bin/bash

mkfifo pipe

echo $$ > pipe

while true; do
    read -r input
    echo "$input" > pipe
done
