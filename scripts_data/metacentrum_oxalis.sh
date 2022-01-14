#!/bin/bash

# TODO Modify the script according to your needs!

# Submit the script to the queue by

# qsub -l walltime=1:0:0 -l select=1:ncpus=1:mem=1gb:scratch_local=1gb -m abe metacentrum_oxalis.sh

# FIXME Set data directories - modify for particular user
DATAFSA='oxalis_assembly_6235.aln.fasta'
DATADIR="/storage/praha1/home/${LOGNAME}"

# Clean-up of SCRATCH (it is temporal directory created by server)
trap 'clean_scratch' TERM EXIT
trap 'cp -a "${SCRATCHDIR}" "${DATADIR}"/ && clean_scratch' TERM

# Required modules
echo "Loading module(s)"
module add iqtree-1.6.12 || exit 1
echo

# Change working directory
echo "Going to working directory ${SCRATCHDIR}"
cd "${SCRATCHDIR}"/ || exit 1
echo

# Copy data
echo "Copying..."
echo "Data file - ${DATAFSA}"
cp -a "${DATADIR}"/"${DATAFSA}" "${SCRATCHDIR}"/ || exit 1
echo

echo "Computing gene tree from ${DATAFSA}..."
iqtree -s "${DATAFSA}" -st DNA -nt 1 -m MFP+I+R+P -lmap ALL -cmax 1000 -nstop 1000 -alrt 10000 -bb 10000 -bnni || { export CLEAN_SCRATCH='false'; exit 1; }
echo

# Copy results back to home directory
echo "Copying data back"
cp -a "${SCRATCHDIR}" "${DATADIR}"/ || export CLEAN_SCRATCH='false'

exit
