#!/bin/bash

# After every Git commit affecting web...
# Use './web_update.sh all' to update also presentation and scripts and data

echo "Syncing 'linuxcourse' directory"
echo
rsync -arv --exclude=*~ --progress linuxcourse striga:~/soubory.trapa.cz/htdocs/ || { echo "Error!" && exit 1; }
echo

# Copy also presentation and scripts and data (pack and Copy)
if [[ "$1" == "all" ]]; then
	# Copy presentation
	echo "Syncing presentation"
	echo
	rsync -av --progress presentation/linux_bash_metacentrum_course.pdf striga:~/soubory.trapa.cz/htdocs/linuxcourse/ || { echo "Error!" && exit 1; }
	echo
	# Zip scripts and data
	echo "Archiving scripts and data"
	echo
	zip -9 -r scripts_data.zip scripts_data -x \*~ || { echo "Error!" && exit 1; }
	echo
	# Copy the ZIP archive
	echo "Syncing scripts and data"
	echo
	rsync -av --progress scripts_data.zip striga:~/soubory.trapa.cz/htdocs/linuxcourse/ || { echo "Error!" && exit 1; }
	echo
	# Delete the local zip archive
	echo "Removing local archive"
	rm scripts_data.zip
	echo
	fi

echo "Done!"

exit
