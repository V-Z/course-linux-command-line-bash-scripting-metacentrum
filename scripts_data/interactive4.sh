#!/bin/bash

# Regular expression explanation:
# From the beginning of the line (^) there is number ([0-9]) at least one time (+) up to the end of the line ($)
NUMBER='^[0-9]+$'

# Function to print help - we will use it twice
function usagehelp {
	echo "Usage: number1 plus/minus/product/quotient number2"
	echo "Use plus for sum, minus for difference, product for multiplication or quotient for quotient."
	exit 1 # End up with an error
	}

# Do we have 3 parameters provided?
if [ "$#" -ne "3" ]; then
	echo "Error! Requiring 3 parameters! Received $# ($*)."
	usagehelp # The function to print help
	fi

# "=~" means we are testing if $1 fits to regular expression in $NUMBER
# Is parameter 1 number?
if [[ ! $1 =~ $NUMBER ]]; then
	echo "Parameter 1 is not an integer!"
	usagehelp # The function to print help
	fi

# Is parameter 3 number?
if [[ ! $3 =~ $NUMBER ]]; then
	echo "Parameter 3 is not an integer!"
	usagehelp # The function to print help
	fi

case "$2" in
	plus)
		echo "$(($1 + $3))"
		;;
	minus)
		echo "$(($1 - $3))"
		;;
	product)
		echo "$(($1 * $3))"
		;;
	quotient)
		echo "$(($1 / $3))"
		;;
	*)
		echo "Wrong option!"
		usagehelp # The function to print help
		;;
	esac

exit
