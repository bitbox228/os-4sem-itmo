#!/bin/bash

egrep -r -o '((\w+)(\.|\-|\_)*)+\@\w+(\.\w+)+' /etc | awk -F: '{$2!=" ";printf("%s, ", $2)}' > email.lst
