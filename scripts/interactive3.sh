#!/bin/bash

# Script has only one parameter ($1) provided
# "case" is evaluating provided parameter and behaving accordingly

case "$1" in
   # "|" means alternatives - more possible inputs
  -d|--disk)
    echo "Your disk usage is:"
    df -h
    ;;
  -u|--uptime)
    echo "Your computer is running:"
    uptime
    ;;
  # This should be every time last possibility - any other input
  # User is then notified he entered nonsense and gets some help
  *) # Any other input
    echo "Wrong option!"
    echo "Usage: -d or --disk for available disk space or"
    echo "-u or --uptime for computer uptime"
    # In this case, exit with error code 1
    exit 1
    ;;
esac

exit
