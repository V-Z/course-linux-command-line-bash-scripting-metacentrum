#!/bin/bash

# All provided values are evaluated in while cycles...
while getopts "hvi:o:a:" INITARGS; do
	case "$INITARGS" in # $INITARGS contains the parameters to evaluate
		h|v) # Accept parameters "-h" or "-v" for help
			echo "The script reads input text file and writes it given number of times into output text file." # What will be done it this is selected...
			echo -e "\t\"-h\" or \"-v\" for this help"
			echo -e "\t\"-i\" for input text file"
			echo -e "\t\"-o\" for output text file"
			echo -e "\t\"-a\" for how many times should be input written into output"
			echo
			exit # Terminate after providing help
			;; # End of this option
		i) # Parameter "-i" accepts some value (e.g. "-i inputfile.txt")
			if [ -r "$OPTARG" ]; then # Check if the input file exists and is readable
				echo "OK, File \"$OPTARG\" exists and is readable. Proceeding..."
				INPUTFILE="$OPTARG" # $OPTARG always contains value of parameter
				else
					echo "Error! File \"$OPTARG\" doesn't exist or isn't readable!"
					echo
					exit 1
				fi
			;; # End of this option
		o) # Parameter "-o" accepts some value (e.g. "-o outputfile.txt")
			if [ -n "$OPTARG" ]; then # Check if there is some name for output variable
				echo "OK, Name for output file was provided: \"$OPTARG\". Proceeding..."
				OUTPUTFILE="$OPTARG" # $OPTARG always contains value of parameter
				else
					echo "Error! No output file name provided!"
					echo
					exit 1
				fi
			;; # End of this option
		a) # Parameter "-a" accepts some value (e.g. "-a X" for number)
			# Check if provided value makes sense (integer between 10 and 300)
			if [[ "$OPTARG" =~ ^[0-9]+$ ]] && [ "$OPTARG" -ge 10 -a "$OPTARG" -le 300 ]; then # The condition is long...
				VALUE=$OPTARG # $OPTARG always contains value of parameter
				echo "Value is OK: $VALUE"
				else
					echo "Error! For parameter \"-a\" you did not provide an integer ranging from 10 to 300!"
					exit 1
				fi
			;; # End of this option
		?)
			echo "Invalid option(s)!"
			echo "See \"$0 -h\" for usage options."
			exit 1
			;; # End of this option
	esac
done

# Check if all required values are provided

if [ -z "$INPUTFILE" -o -z "$OUTPUTFILE" ]; then
	echo "Error! Name of input and/or output file was not provided!"
	echo "See \"$0 -h\" for help usage..."
	echo
	exit 1
	fi

if [ -z "$VALUE" ]; then
	echo "Warning! Value for \"-a\" was not provided! Using default value of 10."
	VALUE=10
	fi

# Do the job...
for I in `seq 1 $VALUE`; do # Repeat task given number of time
	echo -ne "Cycle $I...\r" # Write number of cycle and return cursor to the beginning of the line to overwrite the number in next step
	sleep 1s # Wait 1 second - just for fun ;-)
	cat $INPUTFILE >> $OUTPUTFILE # Do the task - append input to the output - note usage of variables
	done

echo -ne "\n" # Reset cursor to new line
echo
echo "Done!"
echo

exit
