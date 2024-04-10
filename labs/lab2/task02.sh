#!/bin/bash

ps axo pid,cmd | awk -F/ '{if ($3 == "sbin") print $1}' | awk '{print $1}' > res02

# ps a : select all processes except both session leaders (see getsid(2)) and processes not associated with a terminal
# ps x : this option causes ps to list all processes owned by you (same EUID as ps), or to list all processes when used together with the 'a' option

# awk -F  ERE : define  the  input  field separator to be the extended regular expression ERE, before any input is read

# find more on https://explainshell.com/
