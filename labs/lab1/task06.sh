#!/bin/bash

awk '{if ($3 == "(II)") { $3 = "Information"; print $0} else if ($3 == "(WW)") { $3 = "Warning"; print $0; } }' /var/log/anaconda/X.log > full.log
