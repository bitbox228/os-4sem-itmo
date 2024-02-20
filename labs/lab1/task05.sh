#!/bin/bash

awk '{if ($2 == "INFO") print $0}' /var/log/anaconda/syslog > info.log
