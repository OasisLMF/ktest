#!/bin/bash


main()
{
    
	CTRL=ctrl


	mkdir -p work/gul1/summarycalc
	mkdir -p testout


	# test aalcalc
	eve 1 8 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp1.bin
	eve 2 8 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp2.bin
	eve 3 8 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp3.bin
	eve 4 8 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp4.bin
	eve 5 8 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp5.bin
	eve 6 8 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp6.bin
	eve 7 8 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp7.bin
	eve 8 8 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 testout/gulsummarycalcp8.bin
	
	# test aalsummary
	cp testout/gulsummarycalcp1.bin work/gul1/summarycalc/p1.bin
	cp testout/gulsummarycalcp2.bin work/gul1/summarycalc/p2.bin
	cp testout/gulsummarycalcp3.bin work/gul1/summarycalc/p3.bin
	cp testout/gulsummarycalcp4.bin work/gul1/summarycalc/p4.bin
	cp testout/gulsummarycalcp5.bin work/gul1/summarycalc/p5.bin
	cp testout/gulsummarycalcp6.bin work/gul1/summarycalc/p6.bin
	cp testout/gulsummarycalcp7.bin work/gul1/summarycalc/p7.bin
	cp testout/gulsummarycalcp8.bin work/gul1/summarycalc/p8.bin
	
	summaryindex -Kgul1/summarycalc
	aalcalc -x -Kgul1/summarycalc > testout/gulaalcalc1.csv

	cd testout
	
	#md5sum -c ../$CTRL.md5

	#if [ "$?" -ne "0" ]; then
	 # echo "Sorry check failed\n"
	#  exit 1
	#else
	 # echo "Installer test passed.\n"
	# exit 0
	#fi
	#rm *
	cd ../..
	# echo `pwd`
}

main
