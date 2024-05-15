#!/bin/bash

arr=()
n=$1

while (( ${#arr[@]} < $n ));
do
    arr+=(1 2 3 4 5 6 7 8 9 10)
done