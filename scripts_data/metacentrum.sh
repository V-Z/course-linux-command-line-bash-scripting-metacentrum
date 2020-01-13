#!/bin/bash

# Modify the script according to your needs!

# Submit the script to the queue by
# qsub -l walltime=72:0:0 -l select=1:ncpus=8:mem=24gb:scratch_local=10gb -m abe metacentrum.sh
# In this case, maximal running time is 72 hours (72:0:0), it will run on one computer (select=1), use 8 CPU threads (ncpus=8), up to 24 GB of RAM (mem=24gb) and send email when it aborts, begins and completes/ends

# Set data directories
WORKDIR="my_data_dir" # Or something else
DATADIR="/storage/praha1/home/$LOGNAME" # Or other storage

# There is directory /storage/praha1/home/$LOGNAME/my_data_dir (in this case) containing all the data needed for calculations

# Clean-up of SCRATCH (it is temporal directory created by server) - the commands will be launched on the end when the job is done
trap 'clean_scratch' TERM EXIT
trap 'cp -a "$SCRATCHDIR" "$DATADIR"/ && clean_scratch' TERM

# Prepare the task - copy all needed files from working directory into particular computer which will finally do the calculations
cp -a "$DATADIR"/"$WORKDIR"/* "$SCRATCHDIR"/ || exit 1 # If it fails, exit script

# Change working directory - script goes to the directory where calculations are done
cd "$SCRATCHDIR"/ || exit 1 # If it fails, exit script

# Prepare calculations - load required application modules
# See https://wiki.metacentrum.cz/wiki/Kategorie:Applications
# Every application module is loaded by "module add XXX"
# In this case (for example) GNU Parallel and MrBayes
module add parallel
module add mrbayes-3.2.6

# Launch the analysis - calculate MrBayes for multiple files
# Note Parallel will distribute task among 8 CPU threads (-j 8), so that qsub must in this case contain select=1:ncpus=8
find . -name "*.nexus" -print | parallel -j 8 'mb {} | tee -a {}.log'

# Copy results back to home directory
cp -a "$SCRATCHDIR" "$DATADIR"/"$WORKDIR" || export CLEAN_SCRATCH=false

# This is all needed, the script is ready to be launched...

# Don't forget to make it executable and modify it according to your needs...
# If the script was written on Windows, convert EOL and possibly encoding as well...

exit
