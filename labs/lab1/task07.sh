#!/bin/bash

egrep -r -o '((\w+)(\.|\-|\_)*)+\@\w+(\.\w+)+' /etc | awk -F: '{ if ($2 != "") printf("%s, ", $2); }' > email.lst
