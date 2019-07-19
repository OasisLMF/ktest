#!/bin/bash


main()
{
    
	CTRL=ctrl

	mkdir -p testout

	# Test subperil allocation method a1 - Sum and cap to TIV and back-allocate to items in proportion
	eve 1 1 | getmodel | gulcalc -A1 -S10 -L0.1 -r -i - | gultocsv > testout/gulcalci_a1.csv

	eve 1 1 | getmodel | gulcalc -A1 -S10 -L0.1 -r -i - | summarycalc -i -1 testout/summarycalc_S1_a1.bin -2 testout/summarycalc_S2_a1.bin -3 testout/summarycalc_S3_a1.bin
	summarycalctocsv -e < testout/summarycalc_S1_a1.bin > testout/gulsummarycalc_S1_a1_e.csv
	summarycalctocsv -e < testout/summarycalc_S2_a1.bin > testout/gulsummarycalc_S2_a1_e.csv
	summarycalctocsv -e < testout/summarycalc_S3_a1.bin > testout/gulsummarycalc_S3_a1_e.csv

	# Test subperil allocation method a2 - Multiplicative sum and back-allocate to items in proportion
	#eve 1 1 | getmodel | gulcalc -a2 -S10 -L0.1 -r -i - | gultocsv > testout/gulcalci_a2.csv
	#eve 1 1 | getmodel | gulcalc -a2 -S10 -L0.1 -r -i - | summarycalc -i -1 testout/summarycalc_S1_a2.bin -2 testout/summarycalc_S2_a2.bin -3 testout/summarycalc_S3_a2.bin
	#summarycalctocsv -e < testout/summarycalc_S1_a2.bin > testout/gulsummarycalc_S1_a2_e.csv
	#summarycalctocsv -e < testout/summarycalc_S2_a2.bin > testout/gulsummarycalc_S2_a2_e.csv
	#summarycalctocsv -e < testout/summarycalc_S3_a2.bin > testout/gulsummarycalc_S3_a2_e.csv

	cd testout

	md5sum -c ../$CTRL.md5

	 if [ "$?" -ne "0" ]; then
	   echo "Sorry check failed\n"
	  exit 1
	else
	  echo "Installer test passed.\n"
	 exit 0
	 fi
	 rm *
	cd ..

}

main
