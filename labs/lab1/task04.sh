#!/bin/bash
if [ "$PWD" = "$HOME" ]; then
  echo "$HOME"
  exit 0
else
  echo "incorrect directory"
  exit 1
fi
