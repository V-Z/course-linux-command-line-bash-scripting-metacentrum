#!/bin/bash

# Script takes one single parameter - name of input file, e.g. "./raxml_if.sh input.fasta"

INPUT="$1" # Specification of input file

# Determine which CPU is available and which binary use then
if grep -iq avx2 /proc/cpuinfo; then # Does the CPU support AVX2?
	RAXML='raxmlHPC-AVX2' # Select appropriate binary
	elif grep -iq avx /proc/cpuinfo; then # Does the CPU support AVX?
		RAXML='raxmlHPC-AVX' # Select appropriate binary
		elif grep -iq sse3 /proc/cpuinfo; then # Does the CPU support SSE3?
			RAXML='raxmlHPC-SSE3' # Select appropriate binary
			else # The very last option
				RAXML='raxmlHPC' # Slowest oldest CPU...
	fi # End of branching

# Tell us the result
echo "Using ${RAXML} binary."

"${RAXML}" -s "${INPUT}" # All the parameters as usually...

exit
