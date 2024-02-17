#!/bin/bash

wc -l $(find /var/log -name "*.log") | awk '{if ($2=="total") print $1}'
