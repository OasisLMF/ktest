#!/bin/bash


main()
{
    
	CTRL=ctrl

	mkdir -p testout
	# Test 1 - control test without period weights
	cd a1
	mkdir -p work/gul1/summarycalc
	# output summarycalc
	
	eve -n 1 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p1.bin
	eve -n 2 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p2.bin
	
	# test aalcalc
	aalcalc -Kgul1/summarycalc > ../testout/a1_gulaal1.csv


	# Test 2 - test with neutral period weights
	cd ../a2
	mkdir -p work/gul1/summarycalc
	eve -n 1 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p1.bin
	eve -n 2 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p2.bin
	aalcalc -Kgul1/summarycalc > ../testout/a2_gulaal1.csv

	# Test 3 - period 1 is double weight, period 2 is 0 weight
	cd ../a3
	mkdir -p work/gul1/summarycalc
	eve -n 1 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p1.bin
	eve -n 2 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p2.bin
	aalcalc -Kgul1/summarycalc > ../testout/a3_gulaal1.csv


	cd ../testout
	
	md5sum -c ../$CTRL.md5

	if [ "$?" -ne "0" ]; then
	  echo "Sorry check failed\n"
	#  exit 1
	else
	  echo "aalcalc test passed.\n"
	# exit 0
	fi
	#rm *
	cd ../..
	# echo `pwd`
}

main
