#!/bin/bash


main()
{
    
	CTRL=ctrl

	mkdir -p work/gul1/summary
	mkdir -p work/gul1/aal
	mkdir -p work/gul2/summary
	mkdir -p work/gul2/aal
	mkdir -p work/fm1/summary
	mkdir -p work/fm1/aal
	mkdir -p work/fm2/summary
	mkdir -p work/fm2/aal
	mkdir -p testout

	# test eve
	eve 1 2 > testout/eveout1.bin
	eve 2 2 > testout/eveout2.bin

	# # test getmodel
	 eve 1 1 | getmodel > testout/getmodelout.bin
	
	# test gulcalc item stream and coverage stream
	eve 1 1 | getmodel | gulcalc -S100 -L0.1 -r -i - > testout/gulcalci.bin
	eve 1 1 | getmodel | gulcalc -S100 -L0.1 -r -c - > testout/gulcalcc.bin

	# test fmcalc
	fmcalc < testout/gulcalci.bin > testout/fmcalc.bin
	
	# test summary samples
	summarycalc -g -1 testout/gulsummarycalc1.bin  < testout/gulcalcc.bin  
	summarycalc -g -2 testout/gulsummarycalc2.bin  < testout/gulcalcc.bin  
	summarycalc -f -1 testout/fmsummarycalc1.bin   < testout/fmcalc.bin
	summarycalc -f -2 testout/fmsummarycalc2.bin   < testout/fmcalc.bin

	# test eltcalc
	eltcalc < testout/gulsummarycalc1.bin > testout/gulelt1.csv
	eltcalc < testout/gulsummarycalc2.bin > testout/gulelt2.csv
	eltcalc < testout/fmsummarycalc1.bin > testout/fmelt1.csv
	eltcalc < testout/fmsummarycalc2.bin > testout/fmelt2.csv

	# test leccalc
	cp testout/gulsummarycalc2.bin work/gul2/summary/gulsummarycalc2.bin
	cp testout/fmsummarycalc2.bin work/fm2/summary/fmsummarycalc2.bin
	cp testout/gulsummarycalc1.bin work/gul1/summary/gulsummarycalc1.bin
	cp testout/fmsummarycalc1.bin work/fm1/summary/fmsummarycalc1.bin

	leccalc  -Kgul1/summary -F testout/gul_full_uncertainty_aep_1.csv 
	leccalc  -Kgul1/summary -W testout/gul_wheatsheaf_aep_1.csv 
	leccalc  -Kgul1/summary -S testout/gul_sample_mean_aep_1.csv
	leccalc  -Kgul1/summary -M testout/gul_wheatsheaf_mean_aep_1.csv 
    leccalc  -Kgul1/summary -f testout/gul_full_uncertainty_oep_1.csv
	leccalc  -Kgul1/summary -w testout/gul_wheatsheaf_oep_1.csv
	leccalc  -Kgul1/summary -s testout/gul_sample_mean_oep_1.csv 
    leccalc  -Kgul1/summary -m testout/gul_wheatsheaf_mean_oep_1.csv

	leccalc -Kfm1/summary -F testout/fm_full_uncertainty_aep_1.csv  
	leccalc -Kfm1/summary -W testout/fm_wheatsheaf_aep_1.csv
	leccalc -Kfm1/summary -S testout/fm_sample_mean_aep_1.csv
	leccalc -Kfm1/summary -M testout/fm_wheatsheaf_mean_aep_1.csv
    leccalc -Kfm1/summary -f testout/fm_full_uncertainty_oep_1.csv
	leccalc -Kfm1/summary -w testout/fm_wheatsheaf_oep_1.csv
	leccalc -Kfm1/summary -s testout/fm_sample_mean_oep_1.csv
    leccalc -Kfm1/summary -m testout/fm_wheatsheaf_mean_oep_1.csv

	leccalc -r -Kgul1/summary -F testout/gul_full_uncertainty_aep_1_r.csv 
	leccalc -r -Kgul1/summary -W testout/gul_wheatsheaf_aep_1_r.csv 
	leccalc -r -Kgul1/summary -S testout/gul_sample_mean_aep_1_r.csv
	leccalc -r -Kgul1/summary -M testout/gul_wheatsheaf_mean_aep_1_r.csv 
    leccalc -r -Kgul1/summary -f testout/gul_full_uncertainty_oep_1_r.csv
	leccalc -r -Kgul1/summary -w testout/gul_wheatsheaf_oep_1_r.csv
	leccalc -r -Kgul1/summary -s testout/gul_sample_mean_oep_1_r.csv 
    leccalc -r -Kgul1/summary -m testout/gul_wheatsheaf_mean_oep_1_r.csv

	leccalc -r -Kfm1/summary -F testout/fm_full_uncertainty_aep_1_r.csv  
	leccalc -r -Kfm1/summary -W testout/fm_wheatsheaf_aep_1_r.csv
	leccalc -r -Kfm1/summary -S testout/fm_sample_mean_aep_1_r.csv
	leccalc -r -Kfm1/summary -M testout/fm_wheatsheaf_mean_aep_1_r.csv
    leccalc -r -Kfm1/summary -f testout/fm_full_uncertainty_oep_1_r.csv
	leccalc -r -Kfm1/summary -w testout/fm_wheatsheaf_oep_1_r.csv
	leccalc -r -Kfm1/summary -s testout/fm_sample_mean_oep_1_r.csv
    leccalc -r -Kfm1/summary -m testout/fm_wheatsheaf_mean_oep_1_r.csv

	leccalc -r -Kgul2/summary -F testout/gul_full_uncertainty_aep_2_r.csv 
	leccalc -r -Kgul2/summary -W testout/gul_wheatsheaf_aep_2_r.csv 
	leccalc -r -Kgul2/summary -S testout/gul_sample_mean_aep_2_r.csv
	leccalc -r -Kgul2/summary -M testout/gul_wheatsheaf_mean_aep_2_r.csv 
    leccalc -r -Kgul2/summary -f testout/gul_full_uncertainty_oep_2_r.csv
	leccalc -r -Kgul2/summary -w testout/gul_wheatsheaf_oep_2_r.csv
	leccalc -r -Kgul2/summary -s testout/gul_sample_mean_oep_2_r.csv 
    leccalc -r -Kgul2/summary -m testout/gul_wheatsheaf_mean_oep_2_r.csv

	leccalc -r -Kfm2/summary -F testout/fm_full_uncertainty_aep_2_r.csv  
	leccalc -r -Kfm2/summary -W testout/fm_wheatsheaf_aep_2_r.csv
	leccalc -r -Kfm2/summary -S testout/fm_sample_mean_aep_2_r.csv
	leccalc -r -Kfm2/summary -M testout/fm_wheatsheaf_mean_aep_2_r.csv
    leccalc -r -Kfm2/summary -f testout/fm_full_uncertainty_oep_2_r.csv
	leccalc -r -Kfm2/summary -w testout/fm_wheatsheaf_oep_2_r.csv
	leccalc -r -Kfm2/summary -s testout/fm_sample_mean_oep_2_r.csv
    leccalc -r -Kfm2/summary -m testout/fm_wheatsheaf_mean_oep_2_r.csv

	# test pltcalc
	pltcalc < testout/gulsummarycalc1.bin > testout/gulplt1.csv
	pltcalc < testout/gulsummarycalc2.bin > testout/gulplt2.csv
	pltcalc < testout/fmsummarycalc1.bin > testout/fmplt1.csv
	pltcalc < testout/fmsummarycalc2.bin > testout/fmplt2.csv
	
	# test aalcalc
	aalcalc < testout/gulsummarycalc1.bin > testout/gulaalcalc1.bin
	aalcalc < testout/gulsummarycalc2.bin > testout/gulaalcalc2.bin
	aalcalc < testout/fmsummarycalc1.bin > testout/fmaalcalc1.bin
	aalcalc < testout/fmsummarycalc2.bin > testout/fmaalcalc2.bin

	# test aalsummary
	cp testout/gulaalcalc1.bin work/gul1/aal/gulaalcalc1.bin
	cp testout/gulaalcalc2.bin work/gul2/aal/gulaalcalc2.bin
	cp testout/fmaalcalc1.bin work/fm1/aal/fmaalcalc1.bin
	cp testout/fmaalcalc2.bin work/fm2/aal/fmaalcalc2.bin
	aalsummary -Kgul1/aal > testout/gulaalsummary1.csv
	aalsummary -Kgul2/aal > testout/gulaalsummary2.csv
	aalsummary -Kfm1/aal > testout/fmaalsummary1.csv
	aalsummary -Kfm2/aal > testout/fmaalsummary2.csv

	# test stream conversion components
	# stdout to csv
	cdftocsv -s < testout/getmodelout.bin > testout/getmodelout.csv
	gultocsv -f < testout/gulcalci.bin > testout/gulcalci.csv
	gultocsv -f < testout/gulcalcc.bin > testout/gulcalcc.csv
	fmtocsv -f < testout/fmcalc.bin > testout/fmcalc.csv

	summarycalctocsv -f < testout/gulsummarycalc2.bin > testout/gulsummarycalc2.csv
	summarycalctocsv -f < testout/gulsummarycalc1.bin > testout/gulsummarycalc1.csv
	summarycalctocsv -f < testout/fmsummarycalc2.bin > testout/fmsummarycalc2.csv
	summarycalctocsv -f < testout/fmsummarycalc1.bin > testout/fmsummarycalc1.csv

	aalcalctocsv < testout/gulaalcalc1.bin > testout/gulaalcalc1.csv

	# input data to csv and bin
	evetocsv < input/events.bin | evetobin > testout/events.bin
	
	randtocsv -r < static/random.bin | randtobin > testout/random.bin

	itemtocsv < input/items.bin | itemtobin > testout/items.bin

	coveragetocsv < input/coverages.bin | coveragetobin > testout/coverages.bin

	damagebintocsv < static/damage_bin_dict.bin | damagebintobin > testout/damage_bin_dict.bin
	
	fmprogrammetocsv < input/fm_programme.bin | fmprogrammetobin > testout/fm_programme.bin
	
	fmprofiletocsv < input/fm_profile.bin | fmprofiletobin > testout/fm_profile.bin
	
	fmpolicytctocsv < input/fm_policytc.bin | fmpolicytctobin > testout/fm_policytc.bin
	
	fmxreftocsv < input/fm_xref.bin | fmxreftobin > testout/fm_xref.bin

	gulsummaryxreftocsv < input/gulsummaryxref.bin | gulsummaryxreftobin > testout/gulsummaryxref.bin
	
	fmsummaryxreftocsv < input/fmsummaryxref.bin | fmsummaryxreftobin > testout/fmsummaryxref.bin

	returnperiodtocsv < input/returnperiods.bin | returnperiodtobin > testout/returnperiods.bin

	occurrencetocsv < input/occurrence.bin | occurrencetobin -P10000 > testout/occurrence.bin

	vulnerabilitytocsv < static/vulnerability.bin | vulnerabilitytobin -d 102 > testout/vulnerability.bin
	
	cp static/footprint.bin testout/footprint.bin
    cp static/footprint.idx testout/footprint.idx
	
	cd testout
	footprinttocsv > footprint.csv
	mv footprint.bin footprintin.bin
    mv footprint.idx footprintin.idx 
	footprinttobin -i 121 < footprint.csv

	md5sum -c ../$CTRL.md5

	if [ "$?" -ne "0" ]; then
	  echo "Sorry check failed\n"
	#  exit 1
	else
	  echo "Installer test passed.\n"
	# exit 0
	fi
	rm *
	cd ../..
	# echo `pwd`
}

main
