#!/bin/bash

# Arguments are read from command line as parameters of the script
# Order has to be kept (well, not in this case, but generally yes)

echo "Sum of two numbers $1 and $2 is `expr $1 + $2` ."

# "$#" is available every time and contains number of parameters
# (variables) given to the script

echo "Number of parameters is $# ."

# "$*" is available every time and contains all supplied parameters

echo "Those parameters were supplied: $*."

echo

exit
