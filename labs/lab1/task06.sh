#!/bin/bash

warnings=""
infos=""

while IFS= read -r line
  do
    if [[ $line == *"(**)"* ]]; then
      warnings+="\n${line/(**)/Warning}"
    else
      infos+="\n${line/(II)/Information}"
    fi
done < /var/log/anaconda/X.log

echo -e "$warnings" > full.log
echo -e "$infos" >> full.log
