#!/bin/bash

ps xo etime,pid --sort=etime | head --lines=7 | tail --lines=1 | awk '{print $2}'
