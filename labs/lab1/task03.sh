#!/bin/bash

select opt in vi nano links "exit menu"; do

  case $opt in
    vi)
      vi
    ;;
    nano)
      nano
    ;;
    links)
      links
    ;;
    "exit menu")
      break
    ;;
    *)
      echo "invalid option"
    ;;
  esac
done
