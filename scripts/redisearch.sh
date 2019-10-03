#!/bin/bash

set -e

GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;34m'
NO_COLOR='\033[0m'
echo "${LIGHT_BLUE}Execute the next steps in two separate terminals:${NO_COLOR}"
echo "${LIGHT_GREEN}  redis-server${NO_COLOR}"
echo "${LIGHT_GREEN}  redis-cli${NO_COLOR}"
echo "${LIGHT_BLUE}In the shell that shows up. Execute:${NO_COLOR}"
echo "${LIGHT_GREEN}  MODULE LOAD ../RediSearch/build/redisearch.so${NO_COLOR}"
echo "${LIGHT_GREEN}  exit${NO_COLOR}"

# colors
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37
