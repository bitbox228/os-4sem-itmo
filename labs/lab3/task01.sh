#!/bin/bash

mkdir ~/test && echo "catalog test was created successfully" >> ~/report 
touch ~/test/$(date +%d_%m_%Y_%H_%m_%s)
ping "www.net_nikogo.ru" || echo "$(date +%d_%m_%Y_%H_%M_%S) cannot connect to www.net_nikogo.ru" >> ~/report
