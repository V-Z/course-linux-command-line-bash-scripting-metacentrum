#!/bin/bash

# Modify the script according to your needs!

# Set data directories
WORKDIR="bayes_batch"
DATADIR="/storage/praha1/home/$LOGNAME"

# So there is directory /storage/praha1/home/gunnera/bayes_batch containing all the data needed for calculations

# Clean-up of SCRATCH (it is temporal directory created by server) - the commands will be launched on the end when the job is done
trap 'clean_scratch' TERM EXIT
trap 'cp -ar $SCRATCHDIR $DATADIR/ && clean_scratch' TERM

# Prepare the task - copy all needed files from working directory into particular computer which will finally do the calculations
cp -ar $DATADIR/$WORKDIR/* $SCRATCHDIR/  || exit 1

# Change working directory - script goes to the directory where calculations are done
cd $SCRATCHDIR/ || exit 2 # If it fails, exit script

# Prepare calculations - load required application modules
# See https://wiki.metacentrum.cz/wiki/Kategorie:Applications
# Every application module is loaded by "modile add XXX"
. /packages/run/modules-2.0/init/sh
module add parallel # In this case GNU Parallel and MrBayes
module add mrbayes-3.2.2

# Launch the analysis - calculate MrBayes for multiple files
ls -1 *.nexus | parallel -j 8 'mb {} | tee -a {}.log'

# Copy results back to home directory
cp -ar $SCRATCHDIR $DATADIR/$WORKDIR || export CLEAN_SCRATCH=false

# This is all needed, the script is ready to be launched...

# Don't forget to make it executable and modify it according to your needs... If the script was written on Windows, convert EOL and possibly encoding as well...

exit
