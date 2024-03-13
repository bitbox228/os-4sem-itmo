#!/bin/bash

ps axo pid,cmd | awk -F/ '{if ($3 == "sbin") print $1}' | awk '{print $1}' > res02
