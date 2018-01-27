#!/bin/bash

# Arguments are read from user input (script asks for them)

echo "Please, input first value to sum and press 'Enter'"

read V1

echo "Please, input second value to sum and press 'Enter'"

read V2

echo "Sum of two numbers $V1 and $V2 is `expr $V1 + $V2`."

# $(expr $1 + $2) is an alternative - $(...) is same as `...`

echo

exit
