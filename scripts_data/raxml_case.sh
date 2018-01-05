#!/bin/bash

# Script takes one single parameter - name of input file, e.g. "./raxml_if.sh input.fasta"

INPUT="$1" # Specification of input file

# Determine which CPU is available and which binary use then
CPUFLAGS=$(grep -i flags /proc/cpuinfo | uniq)

case "$CPUFLAGS" in
	*avx2*|*AVX2*) # Does the CPU support AVX2?
		RAXML='raxmlHPC-AVX2' # Select appropriate binary
		;;
	*avx*|*AVX*) # Does the CPU support AVX?
		RAXML='raxmlHPC-AVX' # Select appropriate binary
		;;
	*sse3*|*SSE3*) # Does the CPU support SSE3?
		RAXML='raxmlHPC-SSE3' # Select appropriate binary
		;;
	*) # The very last option
		RAXML='raxmlHPC' # Slowest oldest CPU...
		;;
	esac # End of branching

# Tell us the result
echo "Using $RAXML binary."

$RAXML -s $INPUT # All the parameters as usually...

exit
