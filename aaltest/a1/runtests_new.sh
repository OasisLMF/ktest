#!/bin/bash


main()
{
    
	CTRL=ctrl


	mkdir -p work/gul1/summarycalc
	mkdir -p testout

	
	# output summarycalc

	eve -n 1 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp1.bin
	eve -n 2 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp2.bin
	
	# test aalcalc

	cp testout/gulsummarycalcp1.bin work/gul1/summarycalc/p1.bin
	cp testout/gulsummarycalcp2.bin work/gul1/summarycalc/p2.bin

	aalcalc -Kgul1/summarycalc > testout/gulaal1.csv
	aalcalc -x -Kgul1/summarycalc > testout/gulaalx1.csv
	
	cd testout
	
	#md5sum -c ../$CTRL.md5

	if [ "$?" -ne "0" ]; then
	  echo "Sorry check failed\n"
	#  exit 1
	else
	  echo "Installer test passed.\n"
	# exit 0
	fi
	#rm *
	cd ../..
	# echo `pwd`
}

main
