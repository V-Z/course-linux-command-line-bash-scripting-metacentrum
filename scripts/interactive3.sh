#!/bin/bash
# Script has only one parameter ($1) provided as its parameter
# "case" is evaluating provided parameter and behaving accordingly
case "$1" in
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
  *)
    echo "Wrong option!
      Usage: -d or --disk for available disk space or
      -u or --uptime for computer uptime"
      ;;
esac
exit
