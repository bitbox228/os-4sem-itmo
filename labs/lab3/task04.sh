#!/bin/bash

bash inf.sh &
bash inf.sh &
bash inf.sh &

pid_first=$(pgrep -o -f inf.sh)
cpulimit -p $pid_first -l 10 &
pid_last=$(pgrep -n -f inf.sh)
kill $pid_last
