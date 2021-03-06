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
	# test leccalc
	leccalc -Kgul1/summarycalc -f ../testout/a1_gul_lec_f_occ.csv -F ../testout/a1_gul_lec_F_agg.csv -s ../testout/a1_gul_lec_s_occ.csv -S ../testout/a1_gul_lec_S_agg.csv -w ../testout/a1_gul_lec_w_occ.csv -W ../testout/a1_gul_lec_W_agg.csv -m ../testout/a1_gul_lec_m_occ.csv -M ../testout/a1_gul_lec_M_agg.csv  
	leccalc -Kgul1/summarycalc -r -f ../testout/a1_gul_lec_f_occ_r.csv -F ../testout/a1_gul_lec_F_agg_r.csv
	# Test 2 - test with neutral period weights
	cd ../a2
	mkdir -p work/gul1/summarycalc
	eve -n 1 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p1.bin
	eve -n 2 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p2.bin
	aalcalc -Kgul1/summarycalc > ../testout/a2_gulaal1.csv
	leccalc -Kgul1/summarycalc -f ../testout/a2_gul_lec_f_occ.csv -F ../testout/a2_gul_lec_F_agg.csv -s ../testout/a2_gul_lec_s_occ.csv -S ../testout/a2_gul_lec_S_agg.csv -w ../testout/a2_gul_lec_w_occ.csv -W ../testout/a2_gul_lec_W_agg.csv -m ../testout/a2_gul_lec_m_occ.csv -M ../testout/a2_gul_lec_M_agg.csv  
	leccalc -Kgul1/summarycalc -r -f ../testout/a2_gul_lec_f_occ_r.csv -F ../testout/a2_gul_lec_F_agg_r.csv

	# Test 3 - period 1 is double weight, period 2 is 0 weight
	cd ../a3
	mkdir -p work/gul1/summarycalc
	eve -n 1 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p1.bin
	eve -n 2 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p2.bin
	aalcalc -Kgul1/summarycalc > ../testout/a3_gulaal1.csv
	# test leccalc
	leccalc -Kgul1/summarycalc -f ../testout/a3_gul_lec_f_occ.csv -F ../testout/a3_gul_lec_F_agg.csv -s ../testout/a3_gul_lec_s_occ.csv -S ../testout/a3_gul_lec_S_agg.csv -w ../testout/a3_gul_lec_w_occ.csv -W ../testout/a3_gul_lec_W_agg.csv -m ../testout/a3_gul_lec_m_occ.csv -M ../testout/a3_gul_lec_M_agg.csv  
	leccalc -Kgul1/summarycalc -r -f ../testout/a3_gul_lec_f_occ_r.csv -F ../testout/a3_gul_lec_F_agg_r.csv

	cd ../testout
	
	md5sum -c ../$CTRL.md5

	if [ "$?" -ne "0" ]; then
	  echo "Sorry check failed\n"
	#  exit 1
	else
	  echo "weights test passed.\n"
	# exit 0
	fi
	#rm *
	cd ../..
	# echo `pwd`
}

main
