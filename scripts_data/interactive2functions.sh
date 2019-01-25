#!/bin/bash

# Arguments are read from user input (script asks for them)

# Regular expression to check if the provided input is a number
NUMBER='^[0-9]+$'
# From the beginning of the line (^) there is number ([0-9]) at least one time (+) up to the end of the line ($)

# Function to read and check user input
function checkinput {
	while :
		do # Star of the body of the cycles
			read -r INPUT # Here the input from keyboard is received
			if [[ $INPUT =~ $NUMBER ]]; then # Test if $INPUT is a number
				echo "OK, input value is $INPUT."
				break # We have correct value, we can break the cycle and continue
				else # What to do if the user did not provide correct value
					echo "Error! You provided wrong value!" # Tell the user
					echo "Try again (the number):" # Ask user for new input value
				fi # End of the conditional evaluation
		done # End of the while cycles
	} # Read variable is in $INPUT

echo "Please, input first value to sum and press 'Enter'"
# Use the function to read the input
checkinput
V1=$INPUT

# Start of while cycles - run until correct input is provided

echo "Please, input second value to sum and press 'Enter'"
# Use the function to read the input
checkinput
V2=$INPUT

echo

echo "Sum of two numbers $V1 and $V2 is $(("V1" + "V2"))."

echo

exit
