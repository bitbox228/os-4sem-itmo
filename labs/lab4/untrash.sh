#!/bin/bash

file_name="$1"
if [ -z "$file_name" ]; then
    echo "write name of file"
    exit 1
fi

while read -r line 
do 
    file_path=$(echo "$line" | awk '{print $1}')
    trash_name=$(echo "$line" |awk '{print $2}')
    cur_file_name=$(basename "$file_path")
    dir=$(dirname "$file_path")

    if [ "$cur_file_name" != "$file_name" ]; then
        continue
    fi
    while true; do
        read -r -u 1 -p "do u want to restore $file_path >.< [y/N] " response
        case "$response" in
            [yY][eE][sS]|[yY]) 
                if [ ! -d "$dir" ]; then
                    dir="$HOME"
                fi
                if [ -f "$dir/$cur_file_name" ]; then
                    echo "cant restore file because file with name $cur_file_name already exists"
                    while true; do
                        read -r -u 1 -p "please write new name to file: " response
                        if [ -f "$dir/$response" ]; then
                            continue
                        else 
                            cur_file_name=$response
                            break
                        fi
                    done
                fi
                ln ~/.trash/"$trash_name" "$dir/$cur_file_name"
                rm ~/.trash/"$trash_name"
                sed -i "/$trash_name$/d" ~/.trash.log
                break
                ;;
            [nN][oO]|[nN])
                break
                ;;
            *)
                echo "incorrect option"
                ;;
        esac
    done
done < ~/.trash.log