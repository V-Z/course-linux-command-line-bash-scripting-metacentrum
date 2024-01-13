#!/bin/bash

# Simple non-interactive script - no communication with user, only list of commands - prints user name, date, $PATH and free space

echo "Hi, ${USER}, today is $(date) and your PATH is ${PATH}."

echo "Free space on your disk:"
df -h

echo

exit
