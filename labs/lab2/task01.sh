#!/bin/bash

lines=$(ps o pid,cmd U user | tail -n +2 | awk '{ str=$1":"; for (i = 2; i <= NF; i++) {str=str$i" "; } print str; }')
wc -l <<< $lines > res01
echo "$lines" >> res01
