#!/bin/bash


main()
{
    
	CTRL=ctrl

	mkdir -p testout
	# each test runs all gulcalc allocation rules for the given inputs. The input is based on the example test model in ktools, with two items per coverage.
	# first four events only
	cd test1
	# Test1 All subperils have equal loss. 
	gulcalc -a0 -S100 -L0.1 -r -i - < stream/cdf.bin | gultocsv > ../testout/test1_guls_a0.csv
	gulcalc -a1 -S100 -L0.1 -r -i - < stream/cdf.bin | gultocsv > ../testout/test1_guls_a1.csv
	gulcalc -a2 -S100 -L0.1 -r -i - < stream/cdf.bin | gultocsv > ../testout/test1_guls_a2.csv

	cd ../test2
	# Test2 Subperils have different losses. 
	gulcalc -a0 -S100  -r -i - < stream/cdf.bin | gultocsv > ../testout/test2_guls_a0.csv
	gulcalc -a1 -S100  -r -i - < stream/cdf.bin | gultocsv > ../testout/test2_guls_a1.csv
	gulcalc -a2 -S100  -r -i - < stream/cdf.bin | gultocsv > ../testout/test2_guls_a2.csv


	# Test subperil allocation method a3 - Multiplicative sum and back-allocate to items in proportion - not implemented
	#eve 1 1 | getmodel | gulcalc -a3 -S10 -L0.1 -r -i - | gultocsv > testout/gulcalci_a3.csv
	#eve 1 1 | getmodel | gulcalc -a3 -S10 -L0.1 -r -i - | summarycalc -i -1 testout/summarycalc_S1_a3.bin -2 testout/summarycalc_S2_a3.bin -3 testout/summarycalc_S3_a3.bin
	#summarycalctocsv -e < testout/summarycalc_S1_a3.bin > testout/gulsummarycalc_S1_a3_e.csv
	#summarycalctocsv -e < testout/summarycalc_S2_a3.bin > testout/gulsummarycalc_S2_a3_e.csv
	#summarycalctocsv -e < testout/summarycalc_S3_a3.bin > testout/gulsummarycalc_S3_a3_e.csv

	cd ../testout

	md5sum -c ../$CTRL.md5

	 if [ "$?" -ne "0" ]; then
	   echo "Sorry check failed\n"
	  exit 1
	else
	  echo "Peril test passed.\n"
	 exit 0
	 fi
	 rm *
	cd ..

}

main
