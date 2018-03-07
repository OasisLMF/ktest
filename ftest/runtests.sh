#!/bin/bash

main()
{
	mkdir -p testout
	CTRL=ctrl
	# Run fm0
	cd fm0
	eve 1 2 | getmodel | gulcalc -r -S100 -i - > ../testout/gul_c1.bin
	eve 2 2 | getmodel | gulcalc -r -S100 -i - > ../testout/gul_c2.bin
	fmcalc < ../testout/gul_c1.bin | fmtocsv -f > ../testout/fm0_c1.csv
	fmcalc < ../testout/gul_c2.bin | fmtocsv -f > ../testout/fm0_c2.csv
	# Run fm1
	cd ../fm1
	fmcalc < ../testout/gul_c1.bin  > ../testout/fm1_c1.bin
	fmcalc < ../testout/gul_c2.bin  > ../testout/fm1_c2.bin
	# Run fm2 
	cd ../fm2
	fmcalc < ../testout/gul_c1.bin  > ../testout/fm2_c1.bin
	fmcalc < ../testout/gul_c2.bin  > ../testout/fm2_c2.bin
	# Run fm3
	cd ../fm3
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm3.csv
	# Run fm4
	cd ../fm4
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm4.csv
	# Run fm5
	cd ../fm5
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm5.csv
	# Run fm6
	cd ../fm6
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm6.csv
	# Run fm7
	cd ../fm7
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm7.csv
	# Run fm8
	cd ../fm8
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm8.csv
	# Run fm9
	cd ../fm9
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm9.csv
	# Run fm10
	cd ../fm10
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm10.csv
	# Run fm11
	cd ../fm11
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm11.csv
	# # Run fm12
	cd ../fm12
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm12.csv
	# Run fm13
	cd ../fm13
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm13.csv
	# Run fm14
	cd ../fm14
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm14.csv
	# Run fm15
	cd ../fm15
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm15.csv
	# Run fm16
	cd ../fm16
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm16.csv
	# Run fm17
	cd ../fm17
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm17.csv
	# Run fm18
	cd ../fm18
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm18.csv
	# Run fm19
	cd ../fm19
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm19.csv
	# Run fm20
	cd ../fm20
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm20.csv
	# Run fm21
	cd ../fm21
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm21.csv
	# Run fm21
	cd ../fm22
	fmcalc < stream/gulitem.bin | fmtocsv -f > ../testout/fm22.csv
	
	cd ../testout
	md5sum -c ../$CTRL.md5

	if [ "$?" -ne "0" ]; then
	  echo "Sorry check failed\n"
	  exit 1
	else
	  echo "FM tests passed.\n"
	# exit 0
	fi

	# rm *
	cd ../..

}

main
