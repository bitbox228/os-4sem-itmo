#!/bin/bash

n=1000000
k=30

for ((i=1; i<=$k; i++)); do
    bash newmem.sh "$n" &
done