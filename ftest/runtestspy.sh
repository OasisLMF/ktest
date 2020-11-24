#!/bin/bash

main()
{
	mkdir -p testoutpy
	CTRL=ctrlpy
	# Run fm0
	cd fm0
	#eve -n 1 2 | getmodel | gulcalc -r -S100 -i - > ../testoutpy/gul_c1.bin
	#eve -n 2 2 | getmodel | gulcalc -r -S100 -i - > ../testoutpy/gul_c2.bin
	#fmpy < ../testoutpy/gul_c1.bin | fmtocsv -f > ../testoutpy/fm0_c1.csv
	#fmpy < ../testoutpy/gul_c2.bin | fmtocsv -f > ../testoutpy/fm0_c2.csv
	#fmpy -a1 -p input_alloc < ../testoutpy/gul_c1.bin  > ../testoutpy/fm1_c1.bin
	#fmpy -a1 -p input_alloc < ../testoutpy/gul_c2.bin  > ../testoutpy/fm1_c2.bin
	# fm1 and fm2
	# Allocated version of fm0, moved into fm0

	# Run fm3
	cd ../fm3

	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm3_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm3_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm3_a2.csv

	# Run fm4
	cd ../fm4
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm4_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm4_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm4_a2.csv
	# Run fm5
	cd ../fm5
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm5_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm5_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm5_a2.csv
	# Run fm6
	cd ../fm6
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm6_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm6_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm6_a2.csv
	# Run fm7
	cd ../fm7
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm7_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm7_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm7_a2.csv
	# Run fm8
	cd ../fm8
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm8_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm8_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm8_a2.csv
    	# Run fm9
	cd ../fm9
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm9_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm9_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm9_a2.csv
		
	# Run fm10
	cd ../fm10
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm10_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm10_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm10_a2.csv
	# Run fm11
	cd ../fm11
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm11_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm11_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm11_a2.csv
	# # Run fm12
	cd ../fm12
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm12_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm12_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm12_a2.csv
	# Run fm13
	cd ../fm13
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm13_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm13_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm13_a2.csv
	# Run fm14
	cd ../fm14
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm14_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm14_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm14_a2.csv
	# Run fm15
	cd ../fm15
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm15_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm15_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm15_a2.csv
	# Run fm16
	cd ../fm16
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm16_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm16_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm16_a2.csv
	# Run fm17
	cd ../fm17
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm17_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm17_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm17_a2.csv
	# Run fm18
	cd ../fm18
	
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm18_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm18_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm18_a2.csv
	# Run fm19
	cd ../fm19
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm19_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm19_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm19_a2.csv

	# Run fm20
	cd ../fm20
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm20_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm20_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm20_a2.csv

	# Run fm21
	cd ../fm21
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm21_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm21_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm21_a2.csv	
  	cd ../testoutpy
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
