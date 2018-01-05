#!/bin/bash

# After every Git commit affecting web...

echo "Syncing 'linuxcourse' directory"
echo
rsync -arv --exclude=*~ --progress linuxcourse `grep lad ~/.bashrc | grep -o "[a-z]\+@[0-9.]\+"`:/home/vjtz/soubory.trapa.cz/htdocs/
echo

# Copy also presentation and scripts and data (pack and Copy)
if [ "$1" == "all" ]; then
	# Copy presentation
	echo "Syncing presentation"
	echo
	rsync -av --progress presentation/linux_bash_metacentrum_course.pdf `grep lad ~/.bashrc | grep -o "[a-z]\+@[0-9.]\+"`:/home/vjtz/soubory.trapa.cz/htdocs/linuxcourse/
	echo
	# Zip scripts and data
	echo "Archiving scripts and data"
	echo
	zip -9 -r scripts_data.zip scripts_data -x \*~
	echo
	# Copy the ZIP archive
	echo "Syncing scripts and data"
	echo
	rsync -av --progress scripts_data.zip `grep lad ~/.bashrc | grep -o "[a-z]\+@[0-9.]\+"`:/home/vjtz/soubory.trapa.cz/htdocs/linuxcourse/
	echo
	# Delete the local zip archive
	echo "Removing local archive"
	rm scripts_data.zip
	echo
	fi

echo "Done!"

exit
