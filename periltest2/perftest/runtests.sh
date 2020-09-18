#!/bin/bash

main()
{
    
	# Performance test of each gul alloc rule on the same data.
	# The input is based on the example test model in ktools, with two items per coverage (test2 version). 
	# All events
	
	echo "Alloc rule 0"
	time gulcalc -a0 -S10 -r -i - < stream/cdf.bin  > /dev/null
	echo "Alloc rule 1"
	time gulcalc -a1 -S10 -r -i - < stream/cdf.bin  > /dev/null
	echo "Alloc rule 2"
	time gulcalc -a2 -S10 -r -i - < stream/cdf.bin  > /dev/null

	}

main
