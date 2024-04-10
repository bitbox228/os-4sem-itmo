#!/bin/bash

lines=$(ps o pid,cmd U user | tail -n +2 | awk '{ str=$1":"; for (i = 2; i <= NF; i++) {str=str$i" "; } print str; }')
wc -l <<< $lines > res01
echo "$lines" >> res01

# explanation:

# ps : report a snapshot of the current processes
# o <blank-separated or comma-separated list> : specify user-defined format; identical to -o and --format (i.e. offers a way to specify individual output columns)
# U <userlist> : identical to -u and --user

# tail : output the last part of files
# -n +K : output lines starting with the Kth

# awk '{ str=$1":"; for (i = 2; i <= NF; i++) {str=str$i" "; } print str; }' : for each row take the first word, add ':' after it and merge the result with all the remaining words in the row; then print the result

# wc : print newline, word, and byte counts for each file
# wc -l : print the newline counts

# <<< : is known as here-string (pass the $lines as string in wc command)
