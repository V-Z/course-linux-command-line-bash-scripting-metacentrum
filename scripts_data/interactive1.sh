#!/bin/bash

# Arguments are read from command line as parameters of the script
# Order has to be kept (well, not in this case, but generally yes)
# Usage is e.g. ./interactive1.sh 8 5

echo "Sum of two numbers $1 and $2 is `expr $1 + $2`."

# "$#" is available every time and contains number of parameters (variables) given to the script

echo "Number of parameters is: $#"

# "$*" is available every time and contains all supplied parameters

echo "Those parameters were supplied: $*"

#  "$0" is available every time and contains script path

echo "Path to the scrip is: \"$0\""

echo

exit
