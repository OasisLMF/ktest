#!/bin/bash


main()
{
    
	CTRL=ctrl


	mkdir -p work/gul1/aal
	mkdir -p work/gul1/summarycalc
	mkdir -p testout

	# test eve
	eve 1 2 > testout/eveout1.bin
	eve 2 2 > testout/eveout2.bin

	
	# test aalcalc
	eve 1 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 - | aalcalc > testout/gulaalcalcp1.bin
	eve 2 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 - | aalcalc > testout/gulaalcalcp2.bin
	eve 1 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp1.bin
	eve 2 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp2.bin
	
	# test aalsummary
	cp testout/gulaalcalcp1.bin work/gul1/aal/gulaalcalcp1.bin
	cp testout/gulaalcalcp2.bin work/gul1/aal/gulaalcalcp2.bin
	cp testout/gulsummarycalcp1.bin work/gul1/summarycalc/p1.bin
	cp testout/gulsummarycalcp2.bin work/gul1/summarycalc/p2.bin

	aalsummary -Kgul1/aal > testout/gulaalsummary1.csv
	xaalcalc -d -Kgul1/summarycalc > testout/gulxaalcalc1_debug.csv
	xaalcalc -Kgul1/summarycalc > testout/gulxaalcalc1.csv

	aalcalctocsv < testout/gulaalcalcp1.bin > testout/gulaalcalcp1.csv
	aalcalctocsv < testout/gulaalcalcp2.bin > testout/gulaalcalcp2.csv
	
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
