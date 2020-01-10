#!/bin/bash

main()
{
	mkdir -p testout
	CTRL=ctrl
	# Run fm0
	cd fm0
	eve -n 1 2 | getmodel | gulcalc -r -S100 -i - > ../testout/gul_c1.bin
	eve -n 2 2 | getmodel | gulcalc -r -S100 -i - > ../testout/gul_c2.bin
	fmcalc < ../testout/gul_c1.bin | fmtocsv -f > ../testout/fm0_c1.csv
	fmcalc < ../testout/gul_c2.bin | fmtocsv -f > ../testout/fm0_c2.csv
	# Run fm1
	cd ../fm1
	fmcalc -a1 < ../testout/gul_c1.bin  > ../testout/fm1_c1.bin
	fmcalc -a1 < ../testout/gul_c2.bin  > ../testout/fm1_c2.bin
	# Run fm2 
	cd ../fm2
	fmcalc -a1 < ../testout/gul_c1.bin  > ../testout/fm2_c1.bin
	fmcalc -a1 < ../testout/gul_c2.bin  > ../testout/fm2_c2.bin
	# Run fm3
	cd ../fm3
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm3_a0.csv
	fmcalc -a1 < stream/gulitem.bin | fmtocsv -f > ../testout/fm3_a1.csv
	fmcalc -a2 < stream/gulitem.bin | fmtocsv -f > ../testout/fm3_a2.csv
	# Run fm4
	cd ../fm4
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm4_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm4_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm4_a2.csv
	# Run fm5
	cd ../fm5
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm5_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm5_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm5_a2.csv
	# Run fm6
	cd ../fm6
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm6_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm6_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm6_a2.csv
	# Run fm7
	cd ../fm7
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm7_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm7_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm7_a2.csv
	# Run fm8
	cd ../fm8
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm8_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm8_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm8_a2.csv
    # Run fm9
	cd ../fm9
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm9_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm9_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm9_a2.csv
	# Run fm10
	cd ../fm10
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm10_a0.csv
	fmcalc -a1 < stream/gulitem.bin | fmtocsv -f > ../testout/fm10_a1.csv
	fmcalc -a2 < stream/gulitem.bin | fmtocsv -f > ../testout/fm10_a2.csv
	# Run fm11
	cd ../fm11
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm11_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm11_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm11_a2.csv
	# # Run fm12
	cd ../fm12
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm12_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm12_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm12_a2.csv
	# Run fm13
	cd ../fm13
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm13_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm13_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm13_a2.csv
	# Run fm14
	cd ../fm14
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm14_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm14_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm14_a2.csv
	# Run fm15
	cd ../fm15
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm15_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm15_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm15_a2.csv
	# Run fm16
	cd ../fm16
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm16_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm16_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm16_a2.csv
	# Run fm17
	cd ../fm17
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm17_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm17_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm17_a2.csv
	# Run fm18
	cd ../fm18
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm18_a0.csv
	fmcalc -a1 < stream/gulitem.bin | fmtocsv -f > ../testout/fm18_a1.csv
	fmcalc -a2 < stream/gulitem.bin | fmtocsv -f > ../testout/fm18_a2.csv
	# Run fm19
	cd ../fm19
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm19_a0.csv
	fmcalc -a1 < stream/gulitem.bin | fmtocsv -f > ../testout/fm19_a1.csv
	fmcalc -a2 < stream/gulitem.bin | fmtocsv -f > ../testout/fm19_a2.csv
	# Run fm20
	cd ../fm20
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm20_a0.csv
	fmcalc -a1 < stream/gulitem.bin | fmtocsv -f > ../testout/fm20_a1.csv
	fmcalc -a2 < stream/gulitem.bin | fmtocsv -f > ../testout/fm20_a2.csv
	# Run fm21
	cd ../fm21
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm21_a0.csv
	fmcalc -a1 < stream/gulitem.bin | fmtocsv -f > ../testout/fm21_a1.csv
	fmcalc -a2 < stream/gulitem.bin | fmtocsv -f > ../testout/fm21_a2.csv
	# Run fm22
	#cd ../fm22
	#fmcalc -a2 < stream/gulitem.bin | fmtocsv -f > ../testout/fm22.csv
    # Run fm23
	cd ../fm23
	fmcalc -a1 -p direct < stream/gulitem.bin | tee ../testout/fm23_ils_a1.bin | fmtocsv > ../testout/fm23_ils_a1.csv
  	fmcalc -a1 -p ri1 -n < ../testout/fm23_ils_a1.bin | tee ../testout/fm23_ri1_a1.bin | fmtocsv > ../testout/fm23_ri1_a1.csv
	fmcalc -a1 -p ri2 -n < ../testout/fm23_ri1_a1.bin | fmtocsv > ../testout/fm23_ri2_a1.csv
	fmcalc -a2 -p direct < stream/gulitem.bin | tee ../testout/fm23_ils_a2.bin | fmtocsv > ../testout/fm23_ils_a2.csv
  	fmcalc -a2 -p ri1 -n < ../testout/fm23_ils_a2.bin | tee ../testout/fm23_ri1_a2.bin | fmtocsv > ../testout/fm23_ri1_a2.csv
	fmcalc -a2 -p ri2 -n < ../testout/fm23_ri1_a2.bin | fmtocsv > ../testout/fm23_ri2_a2.csv
    # Run fm24
	cd ../fm24
	#alloc rule 2
	fmcalc -a2 < stream/gulitem.bin | tee ../testout/fm24_ils_a2.bin | fmtocsv > ../testout/fm24_ils_a2.csv
  	fmcalc -a0 -p ri1 -n < ../testout/fm24_ils_a2.bin | tee ../testout/fm24_ri1_a2.bin | fmtocsv > ../testout/fm24_ri1_a2.csv
	fmcalc -a2 -p ri2 -n < ../testout/fm24_ri1_a2.bin | tee ../testout/fm24_ri2_a2.bin | fmtocsv > ../testout/fm24_ri2_a2.csv
	fmcalc -a2 -p ri3 -n < ../testout/fm24_ri2_a2.bin | tee ../testout/fm24_ri3_a2.bin | fmtocsv > ../testout/fm24_ri3_a2.csv
	fmcalc -a2 -p ri4 -n < ../testout/fm24_ri3_a2.bin | tee ../testout/fm24_ri4_a2.bin | fmtocsv > ../testout/fm24_a2.csv
	fmcalc -a0 -p ri4 -n < ../testout/fm24_ri3_a2.bin | fmtocsv > ../testout/fm24_a2_a0.csv
	#allocule 1
	fmcalc -a1 < stream/gulitem.bin | tee ../testout/fm24_ils_a1.bin | fmtocsv > ../testout/fm24_ils_a1.csv
  	fmcalc -a0 -p ri1 -n < ../testout/fm24_ils_a1.bin | tee ../testout/fm24_ri1_a1.bin | fmtocsv > ../testout/fm24_ri1_a1.csv
	fmcalc -a1 -p ri2 -n < ../testout/fm24_ri1_a1.bin | tee ../testout/fm24_ri2_a1.bin | fmtocsv > ../testout/fm24_ri2_a1.csv
	fmcalc -a1 -p ri3 -n < ../testout/fm24_ri2_a1.bin | tee ../testout/fm24_ri3_a1.bin | fmtocsv > ../testout/fm24_ri3_a1.csv
	fmcalc -a1 -p ri4 -n < ../testout/fm24_ri3_a1.bin | tee ../testout/fm24_ri4_a1.bin | fmtocsv > ../testout/fm24_a1.csv
	fmcalc -a0 -p ri4 -n < ../testout/fm24_ri3_a1.bin | fmtocsv > ../testout/fm24_a1_a0.csv
	cd ../fm25
	fmcalc -a2 < stream/gulitem.bin | fmtocsv > ../testout/fm25.csv
	cd ../fm26
	fmcalc -a2 < stream/gulitem.bin | fmtocsv > ../testout/fm26.csv	
    # Run fm27
	cd ../fm27
	fmcalc -a0 < stream/gulitem.bin | tee ../testout/fm27_ils.bin | fmtocsv > ../testout/fm27_ils.csv
	fmcalc -a0 -p ri1a -n < ../testout/fm27_ils.bin | tee ../testout/fm27_ri1a.bin | fmtocsv > ../testout/fm27_ri1a.csv
  	fmcalc -a2 -p ri1b -n < ../testout/fm27_ri1a.bin | tee ../testout/fm27_ri1b.bin | fmtocsv > ../testout/fm27_ri1b.csv
  	#fmcalc -a2 -p ri1 -n < ../testout/fm27_ils.bin | tee ../testout/fm27_ri1.bin | fmtocsv > ../testout/fm27_ri1.csv
	fmcalc -a2 -p ri2_alloc -n < ../testout/fm27_ri1b.bin | fmtocsv > ../testout/fm27.csv	
	cd ../fm28
	fmcalc -a2 < stream/gulitem.bin | fmtocsv -f > ../testout/fm28.csv
	cd ../fm29
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm29.csv
	cd ../fm30
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm30.csv
	cd ../fm31
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm31.csv
	cd ../fm32
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm32.csv
	cd ../fm33
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm33.csv
	cd ../fm34
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm34.csv	
	cd ../fm35
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm35_a0.csv
	fmcalc -a1 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm35_a1.csv
	fmcalc -a2 -p input_alloc < stream/gulitem.bin | fmtocsv -f > ../testout/fm35_a2.csv
	cd ../fm36
	fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm36.csv
	cd ../fm37
	fmcalc -a0 < stream/gulitem.bin | tee ../testout/fm37_ils.bin | fmtocsv -f > ../testout/fm37_ils.csv
	fmcalc -a2 -p ri1 -n < ../testout/fm37_ils.bin | fmtocsv > ../testout/fm37.csv
	cd ../fm38
	fmcalc -a2 -n -p ri_1_SEL_2 < ils.bin | fmtocsv -f > ../testout/fm38_2levels.csv
	fmcalc -a2 -n -p ri_1_SEL_3 < ils.bin | fmtocsv -f > ../testout/fm38_3levels.csv
  	cd ../fm39
  	fmcalc -a2 -n -p ri_2_LOC_2 < stream/ri_1_ACC.bin | fmtocsv -f > ../testout/fm39_2levels.csv
	fmcalc -a3 -n -p ri_2_LOC_3 < stream/ri_1_ACC.bin | fmtocsv -f > ../testout/fm39_3levels.csv #  alloc rule 3 = alloc rule 2 for multi-level layers
	#cd ../fm40
	#fmcalc -a0 < stream/gulitem.bin | fmtocsv -f > ../testout/fm40_a0.csv
	#fmcalc -a1 < stream/gulitem.bin | fmtocsv -f > ../testout/fm40_a1.csv
	#fmcalc -a2 < stream/gulitem.bin | fmtocsv -f > ../testout/fm40_a2.csv	
  	cd ../fm42
	fmcalc -a 0 -n -p ri1 <  stream/ils.bin | fmtocsv | grep "^82904" > ../testout/fm42_a0.csv
  	fmcalc -a 1 -n -p ri1 <  stream/ils.bin | fmtocsv | grep "^82904" > ../testout/fm42_a1.csv
  	fmcalc -a 2 -n -p ri1 <  stream/ils.bin | fmtocsv | grep "^82904" > ../testout/fm42_a2.csv
	cd ../fm43
	fmcalc -a 0 < stream/gulitem.bin | fmtocsv > ../testout/fm43_a0.csv
  	fmcalc -a 1 -p input_alloc < stream/gulitem.bin | fmtocsv > ../testout/fm43_a1.csv
  	fmcalc -a 2 -p input_alloc < stream/gulitem.bin | fmtocsv > ../testout/fm43_a2.csv
	cd ../fm44
	fmcalc -a 0 < stream/gulitem.bin | fmtocsv > ../testout/fm44_a0.csv
  	fmcalc -a 1 -p input_alloc < stream/gulitem.bin | fmtocsv > ../testout/fm44_a1.csv
  	fmcalc -a 2 -p input_alloc < stream/gulitem.bin | fmtocsv > ../testout/fm44_a2.csv
  	cd ../fm45
	fmcalc -a 0 < stream/gulitem.bin | fmtocsv | grep "^744678" > ../testout/fm45_a0.csv
  	fmcalc -a 1 -p input_alloc < stream/gulitem.bin | fmtocsv | grep "^744678" > ../testout/fm45_a1.csv
  	fmcalc -a 2 -p input_alloc < stream/gulitem.bin | fmtocsv | grep "^744678" > ../testout/fm45_a2.csv
  	cd ../fm46
	#fmcalc -a 0 < stream/gulitem.bin | fmtocsv > ../testout/fm46_a0.csv
  	fmcalc -a 1 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm46_a1.csv
  	fmcalc -a 2 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm46_a2.csv
  	cd ../fm47
  	fmcalc -a 0 < stream/gulitem.bin | fmtocsv > ../testout/fm47_a0.csv
  	fmcalc -a 1 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm47_a1.csv
  	fmcalc -a 2 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm47_a2.csv
  	cd ../fm48
  	fmcalc -a 0 < stream/gulitem.bin | fmtocsv > ../testout/fm48_a0.csv
  	fmcalc -a 1 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm48_a1.csv
  	fmcalc -a 2 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm48_a2.csv
	cd ../fm49
  	fmcalc -a 0 < stream/gulitem.bin | fmtocsv > ../testout/fm49_a0.csv
  	fmcalc -a 1 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm49_a1.csv
  	fmcalc -a 2 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm49_a2.csv
	cd ../fm51
  	fmcalc -a 0 < stream/gulitem.bin | fmtocsv > ../testout/fm51_a0.csv
  	fmcalc -a 1 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm51_a1.csv
  	fmcalc -a 2 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm51_a2.csv
	cd ../fm52
  	fmcalc -a 0 < stream/gulitem.bin | fmtocsv > ../testout/fm52_a0.csv
  	fmcalc -a 1 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm52_a1.csv
  	fmcalc -a 2 -p input_alloc < stream/gulitem.bin | fmtocsv  > ../testout/fm52_a2.csv
  	cd ../fm53
  	fmcalc -a 2 < stream/gulitem.bin | fmtocsv > ../testout/fm53_a2.csv
  	cd ../fm54
  	fmcalc -S < stream/gulitem.bin | fmtocsv > ../testout/fm54_a0.csv
  	cd ../fm55
  	fmcalc -S < stream/gulitem.bin | fmtocsv > ../testout/fm55_a0.csv
  	cd ../fm56
  	fmcalc -S < stream/gulitem.bin | fmtocsv > ../testout/fm56_a0.csv
  	cd ../fm57
  	fmcalc -S < stream/gulitem.bin | fmtocsv > ../testout/fm57_a0.csv
  	cd ../fm58
  	fmcalc -S < stream/gulitem.bin | fmtocsv > ../testout/fm58_a0.csv
  	cd ../fm59
  	fmcalc -S < stream/gulitem.bin | fmtocsv > ../testout/fm59_a0.csv
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
