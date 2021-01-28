#!/bin/bash

# Arguments are read from user input (script asks for them)

# Regular expression to check if the provided input is a number
NUMBER='^[0-9]+$'
# From the beginning of the line (^) there is number ([0-9]) at least one time (+) up to the end of the line ($)

echo "Please, input first value to sum and press Enter"

# Start of while cycles - run until correct input is provided
while :
	do # Star of the body of the cycles
		read -r V1 # Here the input from keyboard is received
		if [[ ${V1} =~ ${NUMBER} ]]; then # Test if V1 is a number
			echo "OK, input value is ${V1}."
			break # We have correct value, we can break the cycle and continue
			else # What to do if the user did not provide correct value
				echo "Error! You provided wrong value!" # Tell the user
				echo "Try again (the number):" # Ask user for new input value
			fi # End of the conditional evaluation
	done # End of the while cycles

echo "Please, input second value to sum and press Enter"

# Start of while cycles - run until correct input is provided
while :
	do # Star of the body of the cycles
		read -r V2 # Here the input from keyboard is received
		if [[ ${V2} =~ ${NUMBER} ]]; then # Test if V2 is a number
			echo "OK, input value is ${V2}."
			break # We have correct value, we can break the cycle and continue
			else # What to do if the user did not provide correct value
				echo "Error! You provided wrong value!" # Tell the user
				echo "Try again (the number):" # Ask user for new input value
			fi # End of the conditional evaluation
	done # End of the while cycles

echo

echo "Sum of two numbers ${V1} and ${V2} is $(("V1" + "V2"))."

echo

exit
