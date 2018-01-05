#!/bin/bash

# After every Git commit affecting web...
# Use './web_update.sh all' to update also presentation and scripts and data

# The server
REMOTE=`grep lad ~/.bashrc | grep -o "[a-z0-9.]\+@[a-z0-9.]\+"`

echo "Syncing 'linuxcourse' directory"
echo
rsync -arv --exclude=*~ --progress linuxcourse $REMOTE:~/soubory.trapa.cz/htdocs/ || { echo "Error!" && exit 1; }
echo

# Copy also presentation and scripts and data (pack and Copy)
if [ "$1" == "all" ]; then
	# Copy presentation
	echo "Syncing presentation"
	echo
	rsync -av --progress presentation/linux_bash_metacentrum_course.pdf $REMOTE:~/soubory.trapa.cz/htdocs/linuxcourse/ || { echo "Error!" && exit 1; }
	echo
	# Zip scripts and data
	echo "Archiving scripts and data"
	echo
	zip -9 -r scripts_data.zip scripts_data -x \*~ || { echo "Error!" && exit 1; }
	echo
	# Copy the ZIP archive
	echo "Syncing scripts and data"
	echo
	rsync -av --progress scripts_data.zip $REMOTE:~/soubory.trapa.cz/htdocs/linuxcourse/ || { echo "Error!" && exit 1; }
	echo
	# Delete the local zip archive
	echo "Removing local archive"
	rm scripts_data.zip
	echo
	fi

echo "Done!"

exit
