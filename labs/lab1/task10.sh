#!/bin/bash

man bash | tr -cs '[:alpha:]' '\n' | uniq -c | sort -nr | awk '{if (length($2 >= 4)) print $0}' | head -3
