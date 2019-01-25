#!/bin/bash

# Arguments are read from user input (script asks for them)

echo "Please, input first value to sum and press 'Enter'"

read -r V1

echo "Please, input second value to sum and press 'Enter'"

read -r V2

echo "Sum of two numbers $V1 and $V2 is $(("V1" + "V2"))."

# $ is unnecessary on arithmetic variables

echo

exit
