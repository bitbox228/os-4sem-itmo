#!/bin/bash

if [[ $1 -lt $2 ]]; then
  if [[ $3 -lt $2 ]]; then
    echo $2
  else
    echo $3
  fi
else
  if [[ $3 -lt $1 ]]; then
    echo $1
  else 
    echo $3
  fi
fi
