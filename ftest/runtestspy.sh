#!/bin/bash

main()
{
	mkdir -p testoutpy
	CTRL=ctrlpy
	# Run fm0
	cd fm0
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	eve -n 1 2 | getmodel | gulcalc -r -S100 -i - > ../testoutpy/gul_c1.bin
	eve -n 2 2 | getmodel | gulcalc -r -S100 -i - > ../testoutpy/gul_c2.bin
	fmpy < ../testoutpy/gul_c1.bin | fmtocsv -f > ../testoutpy/fm0_c1.csv
	fmpy < ../testoutpy/gul_c2.bin | fmtocsv -f > ../testoutpy/fm0_c2.csv
	fmpy -a1 -p input_alloc < ../testoutpy/gul_c1.bin  > ../testoutpy/fm1_c1.bin
	fmpy -a1 -p input_alloc < ../testoutpy/gul_c2.bin  > ../testoutpy/fm1_c2.bin
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

    #Run fm23
	cd ../fm23
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a1 --create-financial-structure-files -p ri1
	fmpy -a2 --create-financial-structure-files -p ri1
	fmpy -a1 --create-financial-structure-files -p ri2
	fmpy -a2 --create-financial-structure-files -p ri2	
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | tee ../testoutpy/fm23_ils_a1.bin | fmtocsv > ../testoutpy/fm23_ils_a1.csv
  	fmpy -a1 -p ri1 -n < ../testoutpy/fm23_ils_a1.bin | tee ../testoutpy/fm23_ri1_a1.bin | fmtocsv > ../testoutpy/fm23_ri1_a1.csv
	fmpy -a1 -p ri2 -n < ../testoutpy/fm23_ri1_a1.bin | fmtocsv > ../testoutpy/fm23_ri2_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | tee ../testoutpy/fm23_ils_a2.bin | fmtocsv > ../testoutpy/fm23_ils_a2.csv
  	fmpy -a2 -p ri1 -n < ../testoutpy/fm23_ils_a2.bin | tee ../testoutpy/fm23_ri1_a2.bin | fmtocsv > ../testoutpy/fm23_ri1_a2.csv
	fmpy -a2 -p ri2 -n < ../testoutpy/fm23_ri1_a2.bin | fmtocsv > ../testoutpy/fm23_ri2_a2.csv
    
    #Run fm24
	cd ../fm24
	fmpy -a2 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input
	fmpy -a2 --create-financial-structure-files -p RI_1
	fmpy -a1 --create-financial-structure-files -p RI_1
	fmpy -a2 --create-financial-structure-files -p RI_2
	fmpy -a1 --create-financial-structure-files -p RI_2
	fmpy -a2 --create-financial-structure-files -p RI_3
	fmpy -a1 --create-financial-structure-files -p RI_3
	fmpy -a2 --create-financial-structure-files -p RI_4
	fmpy -a1 --create-financial-structure-files -p RI_4
	#alloc rule 2
	# using files generated from oasislmf
	gultobin -S1 -t2 < stream/gulitem2.csv > stream/gulitem2.bin
	fmpy -a2 -p input < stream/gulitem2.bin | tee ../testoutpy/fm24_ils_a2.bin | fmtocsv > ../testoutpy/fm24_ils_a2.csv
  	fmpy -a2 -p RI_1 -n < ../testoutpy/fm24_ils_a2.bin | tee ../testoutpy/fm24_ri1_a2.bin | fmtocsv > ../testoutpy/fm24_ri1_a2.csv
	fmpy -a2 -p RI_2 -n < ../testoutpy/fm24_ri1_a2.bin | tee ../testoutpy/fm24_ri2_a2.bin | fmtocsv > ../testoutpy/fm24_ri2_a2.csv
	fmpy -a2 -p RI_3 -n < ../testoutpy/fm24_ri2_a2.bin | tee ../testoutpy/fm24_ri3_a2.bin | fmtocsv > ../testoutpy/fm24_ri3_a2.csv
	fmpy -a2 -p RI_4 -n < ../testoutpy/fm24_ri3_a2.bin | tee ../testoutpy/fm24_ri4_a2.bin | fmtocsv > ../testoutpy/fm24_ri4_a2.csv

	#allocule 1
	# using files generated from oasislmf
	fmpy -a1 -p input < stream/gulitem2.bin | tee ../testoutpy/fm24_ils_a1.bin | fmtocsv > ../testoutpy/fm24_ils_a1.csv
  	fmpy -a1 -p RI_1 -n < ../testoutpy/fm24_ils_a1.bin | tee ../testoutpy/fm24_ri1_a1.bin | fmtocsv > ../testoutpy/fm24_ri1_a1.csv
	fmpy -a1 -p RI_2 -n < ../testoutpy/fm24_ri1_a1.bin | tee ../testoutpy/fm24_ri2_a1.bin | fmtocsv > ../testoutpy/fm24_ri2_a1.csv
	fmpy -a1 -p RI_3 -n < ../testoutpy/fm24_ri2_a1.bin | tee ../testoutpy/fm24_ri3_a1.bin | fmtocsv > ../testoutpy/fm24_ri3_a1.csv
	fmpy -a1 -p RI_4 -n < ../testoutpy/fm24_ri3_a1.bin | tee ../testoutpy/fm24_ri4_a1.bin | fmtocsv > ../testoutpy/fm24_ri4_a1.csv
	# Run fm25
	#cd ../fm25 - deprecate calcrule 4
	#fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm25.csv
	# Run fm26
	#cd ../fm26 - deprecate calcrule 6
	#fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm26.csv	
	
    # Run fm27
	cd ../fm27
	fmpy -a2 --create-financial-structure-files -p input
	fmpy -a2 --create-financial-structure-files -p RI_1
	fmpy -a2 --create-financial-structure-files -p RI_2
	fmpy -a2 --create-financial-structure-files -p RI_3

	#alloc rule 2
	# using files generated from oasislmf
	gultobin -S1 -t2 < stream/gulitem2.csv > stream/gulitem2.bin
	fmcalc -a2 -p input < stream/gulitem2.bin | tee ../testoutpy/fm27_ils_a2.bin | fmtocsv > ../testoutpy/fm27_ils_a2.csv
  	fmcalc -a2 -p RI_1 -n < ../testoutpy/fm27_ils_a2.bin | tee ../testoutpy/fm27_ri1_a2.bin | fmtocsv > ../testoutpy/fm27_ri1_a2.csv
	fmcalc -a2 -p RI_2 -n < ../testoutpy/fm27_ri1_a2.bin | tee ../testoutpy/fm27_ri2_a2.bin | fmtocsv > ../testoutpy/fm27_ri2_a2.csv
	fmcalc -a2 -p RI_3 -n < ../testoutpy/fm27_ri2_a2.bin | tee ../testoutpy/fm27_ri3_a2.bin | fmtocsv > ../testoutpy/fm27_ri3_a2.csv
	
	# # Run fm28
	cd ../fm28
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a2 --sort-output -p input_alloc  < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm28.csv
	cd ../fm29 # deprecate calcrule 6
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm29.csv
	cd ../fm30 # deprecate calcrule 6
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm30.csv
	cd ../fm31 # deprecate calcrule 6
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm31.csv
	cd ../fm32
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm32.csv
	cd ../fm33
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm33.csv
	cd ../fm34 # deprecate calcrule 18
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm34.csv	
	cd ../fm35
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm35_a0.csv
	fmpy -a1 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm35_a1.csv
	fmpy -a2 -p input_alloc < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm35_a2.csv
	cd ../fm36
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a0 < stream/gulitem2.bin | fmtocsv -f > ../testoutpy/fm36.csv
	cd ../fm37
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a2 --create-financial-structure-files -p ri1
	fmpy -a0 < stream/gulitem2.bin | tee ../testoutpy/fm37_ils.bin | fmtocsv -f > ../testoutpy/fm37_ils.csv
	fmpy -a2 -p ri1 -n < ../testoutpy/fm37_ils.bin | fmtocsv > ../testoutpy/fm37.csv
	cd ../fm38
	fmpy -a2 --create-financial-structure-files -p ri_1_SEL_2
	fmpy -a2 --create-financial-structure-files -p ri_1_SEL_3
	fmpy -a2 -n -p ri_1_SEL_2 < ils.bin | fmtocsv -f > ../testoutpy/fm38_2levels.csv
	fmpy -a2 -n -p ri_1_SEL_3 < ils.bin | fmtocsv -f > ../testoutpy/fm38_3levels.csv
  	cd ../fm39
	fmpy -a2 --create-financial-structure-files -p ri_2_LOC_2
	fmpy -a3 --create-financial-structure-files -p ri_2_LOC_3  	
 	fmpy -a2 -n -p ri_2_LOC_2 < stream/ri_1_ACC.bin | fmtocsv -f > ../testoutpy/fm39_2levels.csv
	fmpy -a3 -n -p ri_2_LOC_3 < stream/ri_1_ACC.bin | fmtocsv -f > ../testoutpy/fm39_3levels.csv #  alloc rule 3 = alloc rule 2 for multi-level layers
	# #cd ../fm40
	# covered in mdk
	#fmpy -a0 < stream/gulitem.bin | fmtocsv -f > ../testoutpy/fm40_a0.csv
	#fmpy -a1 < stream/gulitem.bin | fmtocsv -f > ../testoutpy/fm40_a1.csv
	#fmpy -a2 < stream/gulitem.bin | fmtocsv -f > ../testoutpy/fm40_a2.csv	
  	cd ../fm42
	# fmpy -a0 --create-financial-structure-files -p ri1
	fmpy -a1 --create-financial-structure-files -p ri1
	fmpy -a2 --create-financial-structure-files -p ri1
	# fmpy -a 0 -n -p ri1 <  stream/ils.bin | fmtocsv | grep "^82904" > ../testoutpy/fm42_a0.csv
 	fmpy -a 1 -n -p ri1 <  stream/ils.bin | fmtocsv | grep "^82904" > ../testoutpy/fm42_a1.csv
 	fmpy -a 2 -n -p ri1 <  stream/ils.bin | fmtocsv | grep "^82904" > ../testoutpy/fm42_a2.csv
	cd ../fm43
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a 0 --sort-output < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm43_a0.csv
  	fmpy -a 1 --sort-output -p input_alloc  < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm43_a1.csv
  	fmpy -a 2 --sort-output -p input_alloc  < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm43_a2.csv
	cd ../fm44
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a 0 --sort-output < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm44_a0.csv
  	fmpy -a 1 --sort-output -p input_alloc  < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm44_a1.csv
  	fmpy -a 2 --sort-output -p input_alloc  < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm44_a2.csv
  	cd ../fm45
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	fmpy -a 0 < stream/gulitem2.bin | fmtocsv | grep "^744678" > ../testoutpy/fm45_a0.csv
  	fmpy -a 1 -p input_alloc < stream/gulitem2.bin | fmtocsv | grep "^744678" > ../testoutpy/fm45_a1.csv
  	fmpy -a 2 -p input_alloc < stream/gulitem2.bin | fmtocsv | grep "^744678" > ../testoutpy/fm45_a2.csv
  	cd ../fm46
	#fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
	#fmpy -a 0 < stream/gulitem.bin | fmtocsv > ../testoutpy/fm46_a0.csv
  	fmpy -a 1 --sort-output -p input_alloc  < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm46_a1.csv
  	fmpy -a 2 --sort-output -p input_alloc  < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm46_a2.csv
  	cd ../fm47
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
  	fmpy -a 0 < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm47_a0.csv
  	fmpy -a 1 -p input_alloc < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm47_a1.csv
  	fmpy -a 2 -p input_alloc < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm47_a2.csv
  	cd ../fm48
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc

  	fmpy -a 0 < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm48_a0.csv
  	fmpy -a 1 -p input_alloc < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm48_a1.csv
  	fmpy -a 2 -p input_alloc < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm48_a2.csv
	echo "fm49 to do"
	cd ../fm49
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc
  	fmpy -a 0 < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm49_a0.csv
  	fmpy -a 1 -p input_alloc < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm49_a1.csv
  	fmpy -a 2 -p input_alloc < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm49_a2.csv
	cd ../fm51
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc

  	fmpy -a 0 < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm51_a0.csv
  	fmpy -a 1 -p input_alloc < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm51_a1.csv
  	fmpy -a 2 -p input_alloc < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm51_a2.csv
	cd ../fm52
	fmpy -a0 --create-financial-structure-files -p input
	fmpy -a1 --create-financial-structure-files -p input_alloc
	fmpy -a2 --create-financial-structure-files -p input_alloc

  	fmpy -a 0 --sort-output < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm52_a0.csv
  	fmpy -a 1 --sort-output -p input_alloc < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm52_a1.csv
  	fmpy -a 2 --sort-output -p input_alloc < stream/gulitem2.bin | fmtocsv  > ../testoutpy/fm52_a2.csv

  	cd ../fm53
	fmpy -a2 --create-financial-structure-files -p input_alloc
  	fmpy -a 2 --sort-output -p input_alloc < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm53_a2.csv
  	cd ../fm54
	fmpy -a0 --create-financial-structure-files -p input
  	# fmpy -S < stream/gulitem.bin | fmtocsv > ../testoutpy/fm54_a0.csv
   	fmpy -S < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm54_a0_2.csv
  	cd ../fm55
	fmpy -a0 --create-financial-structure-files -p input
  	# fmpy -S < stream/gulitem.bin | fmtocsv > ../testoutpy/fm55_a0.csv
  	fmpy -S < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm55_a0_2.csv
  	cd ../fm56
	fmpy -a0 --create-financial-structure-files -p input
  	# fmpy -S < stream/gulitem.bin | fmtocsv > ../testoutpy/fm56_a0.csv
  	fmpy -S < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm56_a0_2.csv
  	cd ../fm57
	fmpy -a0 --create-financial-structure-files -p input
  	# fmpy -S < stream/gulitem.bin | fmtocsv > ../testoutpy/fm57_a0.csv
  	fmpy -S < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm57_a0_2.csv
  	cd ../fm58
	fmpy -a0 --create-financial-structure-files -p input
  	# fmpy -S < stream/gulitem.bin | fmtocsv > ../testoutpy/fm58_a0.csv
  	fmpy -S < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm58_a0_2.csv
  	cd ../fm59
	fmpy -a0 --create-financial-structure-files -p input
  	# fmpy -S < stream/gulitem.bin | fmtocsv > ../testoutpy/fm59_a0.csv
  	fmpy -S < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm59_a0_2.csv
	echo "fm60 to do"
  	# cd ../fm60
  	# fmpy -a0 --create-financial-structure-files -p input
  	# fmpy -a0 < stream/gulitem2.bin | fmtocsv > ../testoutpy/fm60_a0.csv

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
