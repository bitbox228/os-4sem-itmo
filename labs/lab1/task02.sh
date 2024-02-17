#!/bin/bash
str=""
for (( ; ; ))
do
  read inp
  if [ $inp = "q" ]; then
    echo "$str" 
    exit
  else 
    str+="$inp"
  fi
done
