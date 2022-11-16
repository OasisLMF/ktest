#!/bin/bash


main()
{
    
	CTRL=ctrl

	mkdir -p testout


# Test 1 - control test without period weights or ensembles

	cd standard # no periods file
	mkdir -p work/gul1/summarycalc
	# output summarycalc
	
	eve -n 1 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p1.bin
	eve -n 2 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p2.bin
	
	# test aalcalc
	aalcalc -Kgul1/summarycalc > ../testout/gulaal1.csv
	# test leccalc
#	leccalc -Kgul1/summarycalc -f ../testout/gul_lec_f_occ.csv -F ../testout/gul_lec_F_agg.csv -s ../testout/gul_lec_s_occ.csv -S ../testout/gul_lec_S_agg.csv -w ../testout/gul_lec_w_occ.csv -W ../testout/gul_lec_W_agg.csv -m ../testout/gul_lec_m_occ.csv -M ../testout/gul_lec_M_agg.csv  
#	leccalc -Kgul1/summarycalc -r -f ../testout/gul_lec_f_occ_r.csv -F ../testout/gul_lec_F_agg_r.csv

# Test 2 - add periods file. 
	cd ../period # period 1 is double weight, period 2 is 0 weight. same as a3

	# output summarycalc
	
	eve -n 1 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p1.bin
	eve -n 2 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p2.bin
	
	# test aalcalc
	aalcalc -Kgul1/summarycalc > ../testout/period_gulaal1.csv
	# test leccalc
#	leccalc -Kgul1/summarycalc -f ../testout/period_gul_lec_f_occ.csv -F ../testout/period_gul_lec_F_agg.csv -s ../testout/period_gul_lec_s_occ.csv -S ../testout/period_gul_lec_S_agg.csv -w ../testout/period_gul_lec_w_occ.csv -W ../testout/period_gul_lec_W_agg.csv -m ../testout/period_gul_lec_m_occ.csv -M ../testout/period_gul_lec_M_agg.csv  
#	leccalc -Kgul1/summarycalc -r -f ../testout/period_gul_lec_f_occ_r.csv -F ../testout/period_gul_lec_F_agg_r.csv
	
# Test 3 - add ensemble file

	cd ../period_ensemble # ensemble file added with 10 x 10 sample ensembles
	mkdir -p work/gul1/summarycalc
	eve -n 1 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p1.bin
	eve -n 2 2 | getmodel | gulcalc -S100 -L0.1 -r -c - | summarycalc -g -1 work/gul1/summarycalc/p2.bin
	aalcalc -Kgul1/summarycalc > ../testout/ensemble_gulaal1.csv
#	leccalc -Kgul1/summarycalc -f ../testout/ensemble_gul_lec_f_occ.csv -F ../testout/ensemble_gul_lec_F_agg.csv -s ../testout/ensemble_gul_lec_s_occ.csv -S ../testout/ensemble_gul_lec_S_agg.csv -w ../testout/ensemble_gul_lec_w_occ.csv -W ../testout/ensemble_gul_lec_W_agg.csv -m ../testout/ensemble_gul_lec_m_occ.csv -M ../testout/ensemble_gul_lec_M_agg.csv  
#	leccalc -Kgul1/summarycalc -r -f ../testout/ensemble_gul_lec_f_occ_r.csv -F ../testout/ensemble_gul_lec_F_agg_r.csv

	
	cd ../testout
	
	md5sum -c ../$CTRL.md5

	if [ "$?" -ne "0" ]; then
	  echo "Sorry check failed\n"
	#  exit 1
	else
	  echo "ensemble test passed.\n"
	# exit 0
	fi
	#rm *
	cd ../..
	# echo `pwd`
}

main
