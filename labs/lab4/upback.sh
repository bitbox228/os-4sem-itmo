#!/bin/bash

mkdir -p /home/user/restore

last_backup=$(ls -d /home/user/* | awk '/Backup-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/{print $0}' | sort -r | head -n 1)
if [ -z "$last_backup" ]; then
    echo "no backup"
    exit 1
fi

for filename in "$last_backup"/*; do
    name="$(basename "$filename")"
    if echo "$name" | grep -Pq '^\w+\.\d{4}-\d{2}-\d{2}$'; then
        continue
    fi
    cp "$filename" /home/user/restore/"$name"
done