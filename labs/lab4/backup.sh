#!/bin/bash

last_backup=$(ls -d /home/user/* | awk '/Backup-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/{print $0}' | sort -r | head -n 1 | tail -c 11)
if [ -z "$last_backup" ]; then
    last_backup="1970-01-01"
fi

touch /home/user/backup-report

((difference = $(date "+%s") - $(date --date="$last_backup" "+%s")))
if [[ $difference -le 7*24*60*60 ]]; then
    # update backup
    echo "[$(date +%F)] updating backup folder: Backup-$last_backup" >> /home/user/backup-report
    new_files=""
    update_files=""
    for filename in /home/user/source/*; do
        if [ -f "/home/user/Backup-$last_backup/$(basename "$filename")" ]; then
            copy_size=$(stat -c %s "/home/user/Backup-$last_backup/$(basename "$filename")")
            size=$(stat -c %s "$filename")
            if [[ $size -ne $copy_size ]]; then
                mv "/home/user/Backup-$last_backup/$(basename "$filename")" "/home/user/Backup-$last_backup/$(basename "$filename").$(date +%F)"
                cp "$filename" /home/user/Backup-"$last_backup"
                update_files+="$(basename "$filename") $(basename "$filename").$(date +%F)\n"
            fi
        else
            cp "$filename" /home/user/Backup-"$last_backup"
            new_files+="$(basename "$filename")\n"
        fi
    done
    echo -e -n "$new_files$update_files" >> /home/user/backup-report
else 
    # new backup
    last_backup=$(date +%F)
    mkdir /home/user/Backup-"$last_backup"
    echo "[$(date +%F)] new backup folder created: Backup-$last_backup" >> /home/user/backup-report
    for filename in /home/user/source/*; do
        if [ ! -f "$filename" ]; then
            continue
        fi
        cp "$filename" /home/user/Backup-"$last_backup"
        echo "$(basename "$filename")" >> /home/user/backup-report
    done
fi