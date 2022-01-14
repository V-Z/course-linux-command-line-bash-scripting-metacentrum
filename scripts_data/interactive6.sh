#!/bin/bash

# We expect exactly one parameter
if [[ "$#" -ne "1" ]]; then
	echo "Error! Exactly one parameter is required!"
	exit 1
	fi

# Verify that file exists and is readable
if [[ ! -r "$1" ]]; then
	echo "Error! The file provided does not exist or is not readable!"
	exit 1
	fi

# Do the operation with input file..
echo "Size of the file is $(du -sh "$1" | cut -f 1)."
echo "The file has $(wc -l "$1" | cut -d ' ' -f 1) lines."

echo "Making backup of the file $1..."
# Copy file to backup (*.bak). If it succeeds, report it, if it fails exit with error
{ cp "$1" "$1".bak && echo "Backup saved as $1".bak; } || { echo "Error! Making backup of $1 failed!"; exit 1; }

echo "Done!"

exit
