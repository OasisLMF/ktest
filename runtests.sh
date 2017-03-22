#!/bin/bash

init()
{
	CTRL=ctrl
	echo $OSTYPE
	if [[ "$OSTYPE" == "cygwin" ]]; then
		if [ -f cw64bld ]; then
	 	echo 'Running Windows test'
	 	PATH=/cygdrive/c/Oasis/bin:$PATH
	
	 	else echo 'Running Cygwin test'
	 	fi
	 else echo 'Running Linux test'
	 fi
	if [ ! -d examples ]; then
		tar -xzf examples.tar.gz
	fi
}

installertest()
{
    echo 'Running installer test'
    cd installertest	
	mkdir -p testout
	cd ..
	
	cd examples
	# Restore examples folder to initial state
	cp ../ftest/fm0/items.bin input/items.bin
	cp ../ftest/fm0/coverages.bin input/coverages.bin
	cp ../ftest/fm0/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm0/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm0/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm0/fm_profile.bin input/fm_profile.bin
	CTRL=ctrl

	mkdir -p work/gul1/summary
	mkdir -p work/gul1/aal
	mkdir -p work/gul2/summary
	mkdir -p work/gul2/aal
	mkdir -p work/fm1/summary
	mkdir -p work/fm1/aal
	mkdir -p work/fm2/summary
	mkdir -p work/fm2/aal

	# test eve
	eve 1 2 > ../installertest/testout/eveout1.bin
	eve 2 2 > ../installertest/testout/eveout2.bin

	# # test getmodel
	 eve 1 1 | getmodel > ../installertest/testout/getmodelout.bin
	
	# test gulcalc item stream and coverage stream
	eve 1 1 | getmodel | gulcalc -S100 -L0.1 -r -i - > ../installertest/testout/gulcalci.bin
	eve 1 1 | getmodel | gulcalc -S100 -L0.1 -r -c - > ../installertest/testout/gulcalcc.bin

	# test fmcalc
	fmcalc < ../installertest/testout/gulcalci.bin > ../installertest/testout/fmcalc.bin
	
	# test summary samples
	summarycalc -g -1 ../installertest/testout/gulsummarycalc1.bin  < ../installertest/testout/gulcalcc.bin  
	summarycalc -g -2 ../installertest/testout/gulsummarycalc2.bin  < ../installertest/testout/gulcalcc.bin  
	summarycalc -f -1 ../installertest/testout/fmsummarycalc1.bin   < ../installertest/testout/fmcalc.bin
	summarycalc -f -2 ../installertest/testout/fmsummarycalc2.bin   < ../installertest/testout/fmcalc.bin

	# test eltcalc
	eltcalc < ../installertest/testout/gulsummarycalc1.bin > ../installertest/testout/gulelt1.csv
	eltcalc < ../installertest/testout/gulsummarycalc2.bin > ../installertest/testout/gulelt2.csv
	eltcalc < ../installertest/testout/fmsummarycalc1.bin > ../installertest/testout/fmelt1.csv
	eltcalc < ../installertest/testout/fmsummarycalc2.bin > ../installertest/testout/fmelt2.csv

	# test leccalc
	cp ../installertest/testout/gulsummarycalc2.bin work/gul2/summary/gulsummarycalc2.bin
	cp ../installertest/testout/fmsummarycalc2.bin work/fm2/summary/fmsummarycalc2.bin
	cp ../installertest/testout/gulsummarycalc1.bin work/gul1/summary/gulsummarycalc1.bin
	cp ../installertest/testout/fmsummarycalc1.bin work/fm1/summary/fmsummarycalc1.bin

	leccalc  -Kgul1/summary -F ../installertest/testout/gul_full_uncertainty_aep_1.csv 
	leccalc  -Kgul1/summary -W ../installertest/testout/gul_wheatsheaf_aep_1.csv 
	leccalc  -Kgul1/summary -S ../installertest/testout/gul_sample_mean_aep_1.csv
	leccalc  -Kgul1/summary -M ../installertest/testout/gul_wheatsheaf_mean_aep_1.csv 
    leccalc  -Kgul1/summary -f ../installertest/testout/gul_full_uncertainty_oep_1.csv
	leccalc  -Kgul1/summary -w ../installertest/testout/gul_wheatsheaf_oep_1.csv
	leccalc  -Kgul1/summary -s ../installertest/testout/gul_sample_mean_oep_1.csv 
    leccalc  -Kgul1/summary -m ../installertest/testout/gul_wheatsheaf_mean_oep_1.csv

	leccalc -Kfm1/summary -F ../installertest/testout/fm_full_uncertainty_aep_1.csv  
	leccalc -Kfm1/summary -W ../installertest/testout/fm_wheatsheaf_aep_1.csv
	leccalc -Kfm1/summary -S ../installertest/testout/fm_sample_mean_aep_1.csv
	leccalc -Kfm1/summary -M ../installertest/testout/fm_wheatsheaf_mean_aep_1.csv
    leccalc -Kfm1/summary -f ../installertest/testout/fm_full_uncertainty_oep_1.csv
	leccalc -Kfm1/summary -w ../installertest/testout/fm_wheatsheaf_oep_1.csv
	leccalc -Kfm1/summary -s ../installertest/testout/fm_sample_mean_oep_1.csv
    leccalc -Kfm1/summary -m ../installertest/testout/fm_wheatsheaf_mean_oep_1.csv

	leccalc -r -Kgul1/summary -F ../installertest/testout/gul_full_uncertainty_aep_1_r.csv 
	leccalc -r -Kgul1/summary -W ../installertest/testout/gul_wheatsheaf_aep_1_r.csv 
	leccalc -r -Kgul1/summary -S ../installertest/testout/gul_sample_mean_aep_1_r.csv
	leccalc -r -Kgul1/summary -M ../installertest/testout/gul_wheatsheaf_mean_aep_1_r.csv 
    leccalc -r -Kgul1/summary -f ../installertest/testout/gul_full_uncertainty_oep_1_r.csv
	leccalc -r -Kgul1/summary -w ../installertest/testout/gul_wheatsheaf_oep_1_r.csv
	leccalc -r -Kgul1/summary -s ../installertest/testout/gul_sample_mean_oep_1_r.csv 
    leccalc -r -Kgul1/summary -m ../installertest/testout/gul_wheatsheaf_mean_oep_1_r.csv

	leccalc -r -Kfm1/summary -F ../installertest/testout/fm_full_uncertainty_aep_1_r.csv  
	leccalc -r -Kfm1/summary -W ../installertest/testout/fm_wheatsheaf_aep_1_r.csv
	leccalc -r -Kfm1/summary -S ../installertest/testout/fm_sample_mean_aep_1_r.csv
	leccalc -r -Kfm1/summary -M ../installertest/testout/fm_wheatsheaf_mean_aep_1_r.csv
    leccalc -r -Kfm1/summary -f ../installertest/testout/fm_full_uncertainty_oep_1_r.csv
	leccalc -r -Kfm1/summary -w ../installertest/testout/fm_wheatsheaf_oep_1_r.csv
	leccalc -r -Kfm1/summary -s ../installertest/testout/fm_sample_mean_oep_1_r.csv
    leccalc -r -Kfm1/summary -m ../installertest/testout/fm_wheatsheaf_mean_oep_1_r.csv

	leccalc -r -Kgul2/summary -F ../installertest/testout/gul_full_uncertainty_aep_2_r.csv 
	leccalc -r -Kgul2/summary -W ../installertest/testout/gul_wheatsheaf_aep_2_r.csv 
	leccalc -r -Kgul2/summary -S ../installertest/testout/gul_sample_mean_aep_2_r.csv
	leccalc -r -Kgul2/summary -M ../installertest/testout/gul_wheatsheaf_mean_aep_2_r.csv 
    leccalc -r -Kgul2/summary -f ../installertest/testout/gul_full_uncertainty_oep_2_r.csv
	leccalc -r -Kgul2/summary -w ../installertest/testout/gul_wheatsheaf_oep_2_r.csv
	leccalc -r -Kgul2/summary -s ../installertest/testout/gul_sample_mean_oep_2_r.csv 
    leccalc -r -Kgul2/summary -m ../installertest/testout/gul_wheatsheaf_mean_oep_2_r.csv

	leccalc -r -Kfm2/summary -F ../installertest/testout/fm_full_uncertainty_aep_2_r.csv  
	leccalc -r -Kfm2/summary -W ../installertest/testout/fm_wheatsheaf_aep_2_r.csv
	leccalc -r -Kfm2/summary -S ../installertest/testout/fm_sample_mean_aep_2_r.csv
	leccalc -r -Kfm2/summary -M ../installertest/testout/fm_wheatsheaf_mean_aep_2_r.csv
    leccalc -r -Kfm2/summary -f ../installertest/testout/fm_full_uncertainty_oep_2_r.csv
	leccalc -r -Kfm2/summary -w ../installertest/testout/fm_wheatsheaf_oep_2_r.csv
	leccalc -r -Kfm2/summary -s ../installertest/testout/fm_sample_mean_oep_2_r.csv
    leccalc -r -Kfm2/summary -m ../installertest/testout/fm_wheatsheaf_mean_oep_2_r.csv

	# test pltcalc
	pltcalc < ../installertest/testout/gulsummarycalc1.bin > ../installertest/testout/gulplt1.csv
	pltcalc < ../installertest/testout/gulsummarycalc2.bin > ../installertest/testout/gulplt2.csv
	pltcalc < ../installertest/testout/fmsummarycalc1.bin > ../installertest/testout/fmplt1.csv
	pltcalc < ../installertest/testout/fmsummarycalc2.bin > ../installertest/testout/fmplt2.csv
	
	# test aalcalc
	aalcalc < ../installertest/testout/gulsummarycalc1.bin > ../installertest/testout/gulaalcalc1.bin
	aalcalc < ../installertest/testout/gulsummarycalc2.bin > ../installertest/testout/gulaalcalc2.bin
	aalcalc < ../installertest/testout/fmsummarycalc1.bin > ../installertest/testout/fmaalcalc1.bin
	aalcalc < ../installertest/testout/fmsummarycalc2.bin > ../installertest/testout/fmaalcalc2.bin

	# test aalsummary
	cp ../installertest/testout/gulaalcalc1.bin work/gul1/aal/gulaalcalc1.bin
	cp ../installertest/testout/gulaalcalc2.bin work/gul2/aal/gulaalcalc2.bin
	cp ../installertest/testout/fmaalcalc1.bin work/fm1/aal/fmaalcalc1.bin
	cp ../installertest/testout/fmaalcalc2.bin work/fm2/aal/fmaalcalc2.bin
	aalsummary -Kgul1/aal > ../installertest/testout/gulaalsummary1.csv
	aalsummary -Kgul2/aal > ../installertest/testout/gulaalsummary2.csv
	aalsummary -Kfm1/aal > ../installertest/testout/fmaalsummary1.csv
	aalsummary -Kfm2/aal > ../installertest/testout/fmaalsummary2.csv

	# test stream conversion components
	# stdout to csv
	cdftocsv -s < ../installertest/testout/getmodelout.bin > ../installertest/testout/getmodelout.csv
	gultocsv -f < ../installertest/testout/gulcalci.bin > ../installertest/testout/gulcalci.csv
	gultocsv -f < ../installertest/testout/gulcalcc.bin > ../installertest/testout/gulcalcc.csv
	fmtocsv -f < ../installertest/testout/fmcalc.bin > ../installertest/testout/fmcalc.csv

	summarycalctocsv -f < ../installertest/testout/gulsummarycalc2.bin > ../installertest/testout/gulsummarycalc2.csv
	summarycalctocsv -f < ../installertest/testout/gulsummarycalc1.bin > ../installertest/testout/gulsummarycalc1.csv
	summarycalctocsv -f < ../installertest/testout/fmsummarycalc2.bin > ../installertest/testout/fmsummarycalc2.csv
	summarycalctocsv -f < ../installertest/testout/fmsummarycalc1.bin > ../installertest/testout/fmsummarycalc1.csv

	aalcalctocsv < ../installertest/testout/gulaalcalc1.bin > ../installertest/testout/gulaalcalc1.csv

	# input data to csv and bin
	evetocsv < ../examples/input/events.bin | evetobin > ../installertest/testout/events.bin
	
	randtocsv -r < ../examples/static/random.bin | randtobin > ../installertest/testout/random.bin

	itemtocsv < ../examples/input/items.bin | itemtobin > ../installertest/testout/items.bin

	coveragetocsv < ../examples/input/coverages.bin | coveragetobin > ../installertest/testout/coverages.bin

	damagebintocsv < ../examples/static/damage_bin_dict.bin | damagebintobin > ../installertest/testout/damage_bin_dict.bin
	
	fmprogrammetocsv < ../examples/input/fm_programme.bin | fmprogrammetobin > ../installertest/testout/fm_programme.bin
	
	fmprofiletocsv < ../examples/input/fm_profile.bin | fmprofiletobin > ../installertest/testout/fm_profile.bin
	
	fmpolicytctocsv < ../examples/input/fm_policytc.bin | fmpolicytctobin > ../installertest/testout/fm_policytc.bin
	
	fmxreftocsv < ../examples/input/fm_xref.bin | fmxreftobin > ../installertest/testout/fm_xref.bin

	gulsummaryxreftocsv < ../examples/input/gulsummaryxref.bin | gulsummaryxreftobin > ../installertest/testout/gulsummaryxref.bin
	
	fmsummaryxreftocsv < ../examples/input/fmsummaryxref.bin | fmsummaryxreftobin > ../installertest/testout/fmsummaryxref.bin

	returnperiodtocsv < ../examples/input/returnperiods.bin | returnperiodtobin > ../installertest/testout/returnperiods.bin

	occurrencetocsv < ../examples/input/occurrence.bin | occurrencetobin -P10000 > ../installertest/testout/occurrence.bin

	vulnerabilitytocsv < ../examples/static/vulnerability.bin | vulnerabilitytobin -d 102 > ../installertest/testout/vulnerability.bin
	
	cp static/footprint.bin ../installertest/testout/footprint.bin
    cp static/footprint.idx ../installertest/testout/footprint.idx
	
	cd ../installertest/testout
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

ftest()
{
	echo 'Running fm test'
	cd ftest
	mkdir -p testout
	
	cd ../examples
	# Restore examples folder to initial state
	cp ../ftest/fm0/items.bin input/items.bin
	cp ../ftest/fm0/coverages.bin input/coverages.bin
	cp ../ftest/fm0/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm0/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm0/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm0/fm_profile.bin input/fm_profile.bin
		
	eve 1 2 | getmodel | gulcalc -r -S100 -i - > ../ftest/testout/gul_c1.bin
	eve 2 2 | getmodel | gulcalc -r -S100 -i - > ../ftest/testout/gul_c2.bin
	# Run fm0
	cp ../ftest/fm0/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm0/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm0/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm0/fm_profile.bin input/fm_profile.bin

	fmcalc < ../ftest/testout/gul_c1.bin | fmtocsv -f > ../ftest/testout/fm0_c1.csv
	fmcalc < ../ftest/testout/gul_c2.bin | fmtocsv -f > ../ftest/testout/fm0_c2.csv
	# Run fm1
	cp ../ftest/fm1/items.bin input/items.bin
	cp ../ftest/fm1/coverages.bin input/coverages.bin	
	cp ../ftest/fm1/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm1/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm1/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm1/fm_profile.bin input/fm_profile.bin

	fmcalc < ../ftest/testout/gul_c1.bin  > ../ftest/testout/fm1_c1.bin
	fmcalc < ../ftest/testout/gul_c2.bin  > ../ftest/testout/fm1_c2.bin
	# Run fm2 
	cp ../ftest/fm2/items.bin input/items.bin
	cp ../ftest/fm2/coverages.bin input/coverages.bin
	cp ../ftest/fm2/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm2/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm2/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm2/fm_profile.bin input/fm_profile.bin
	fmcalc < ../ftest/testout/gul_c1.bin  > ../ftest/testout/fm2_c1.bin
	fmcalc < ../ftest/testout/gul_c2.bin  > ../ftest/testout/fm2_c2.bin
	# Run fm3
	cp ../ftest/fm3/items.bin input/items.bin
	cp ../ftest/fm3/coverages.bin input/coverages.bin	
	cp ../ftest/fm3/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm3/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm3/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm3/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm3/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm3.csv
	# Run fm4
	cp ../ftest/fm4/items.bin input/items.bin
	cp ../ftest/fm4/coverages.bin input/coverages.bin	
	cp ../ftest/fm4/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm4/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm4/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm4/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm4/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm4.csv
	# Run fm5
	cp ../ftest/fm5/items.bin input/items.bin
	cp ../ftest/fm5/coverages.bin input/coverages.bin	
	cp ../ftest/fm5/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm5/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm5/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm5/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm5/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm5.csv
	# Run fm6
	cp ../ftest/fm6/items.bin input/items.bin
	cp ../ftest/fm6/coverages.bin input/coverages.bin	
	cp ../ftest/fm6/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm6/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm6/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm6/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm6/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm6.csv
	# Run fm7
	cp ../ftest/fm7/items.bin input/items.bin
	cp ../ftest/fm7/coverages.bin input/coverages.bin	
	cp ../ftest/fm7/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm7/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm7/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm7/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm7/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm7.csv
	# Run fm8
	cp ../ftest/fm8/items.bin input/items.bin
	cp ../ftest/fm8/coverages.bin input/coverages.bin	
	cp ../ftest/fm8/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm8/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm8/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm8/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm8/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm8.csv
	# Run fm9
	cp ../ftest/fm9/items.bin input/items.bin
	cp ../ftest/fm9/coverages.bin input/coverages.bin	
	cp ../ftest/fm9/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm9/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm9/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm9/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm9/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm9.csv
	# Run fm10
	cp ../ftest/fm10/items.bin input/items.bin
	cp ../ftest/fm10/coverages.bin input/coverages.bin	
	cp ../ftest/fm10/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm10/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm10/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm10/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm10/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm10.csv
	# Run fm11
	cp ../ftest/fm11/items.bin input/items.bin
	cp ../ftest/fm11/coverages.bin input/coverages.bin	
	cp ../ftest/fm11/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm11/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm11/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm11/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm11/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm11.csv
	# # Run fm12
	cp ../ftest/fm12/items.bin input/items.bin
	cp ../ftest/fm12/coverages.bin input/coverages.bin	
	cp ../ftest/fm12/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm12/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm12/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm12/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm12/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm12.csv
	cp ../ftest/fm12/fm_profile_alloc.bin input/fm_profile.bin
	cp ../ftest/fm12/fm_xref_alloc.bin input/fm_xref.bin
	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm12_alloc.csv
	# Run fm13
	cp ../ftest/fm13/items.bin input/items.bin
	cp ../ftest/fm13/coverages.bin input/coverages.bin	
	cp ../ftest/fm13/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm13/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm13/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm13/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm13/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm13.csv
	# Run fm14
	cp ../ftest/fm14/items.bin input/items.bin
	cp ../ftest/fm14/coverages.bin input/coverages.bin	
	cp ../ftest/fm14/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm14/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm14/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm14/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm14/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm14.csv
	# Run fm15
	cp ../ftest/fm15/items.bin input/items.bin
	cp ../ftest/fm15/coverages.bin input/coverages.bin	
	cp ../ftest/fm15/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm15/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm15/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm15/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm15/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm15.csv
	# Run fm16
	cp ../ftest/fm16/items.bin input/items.bin
	cp ../ftest/fm16/coverages.bin input/coverages.bin	
	cp ../ftest/fm16/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm16/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm16/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm16/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm16/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm16.csv

	# Run fm17
	cp ../ftest/fm17/items.bin input/items.bin
	cp ../ftest/fm17/coverages.bin input/coverages.bin	
	cp ../ftest/fm17/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm17/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm17/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm17/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm17/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm17.csv

	# Run fm18
	cp ../ftest/fm18/items.bin input/items.bin
	cp ../ftest/fm18/coverages.bin input/coverages.bin	
	cp ../ftest/fm18/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm18/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm18/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm18/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm18/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm18.csv

	# Run fm19
	cp ../ftest/fm19/items.bin input/items.bin
	cp ../ftest/fm19/coverages.bin input/coverages.bin	
	cp ../ftest/fm19/fm_xref.bin input/fm_xref.bin
	cp ../ftest/fm19/fm_programme.bin input/fm_programme.bin
	cp ../ftest/fm19/fm_policytc.bin input/fm_policytc.bin
	cp ../ftest/fm19/fm_profile.bin input/fm_profile.bin
	cp ../ftest/fm19/guls.bin .

	fmcalc < guls.bin | fmtocsv -f > ../ftest/testout/fm19.csv
	cd ../ftest/testout
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

multiplex()
{
	tmp_dir=$(mktemp -d)
	mkfifo "$tmp_dir/f1" "$tmp_dir/f2" "$tmp_dir/f3"
	gultocsv <"$tmp_dir/f1" > "gulzz.csv" & pid1=$!
	fmtocsv <"$tmp_dir/f2" > "fmcalc_.csv" & pid2=$!
	cat <"$tmp_dir/f3" > "gulzz.bin" & pid3=$!
	cd examples
	eve 1 1 1 | getmodel 1 | gulcalc -C1 -S100 -r -R |	tee "$tmp_dir/f1" tee "$tmp_dir/f3"  | fmcalc | tee "$tmp_dir/f2" > ../fmcalc.bin
	rm -rf "$tmp_dir"
	wait $pid1 $pid2 $pid3
}

init
installertest
ftest
#multiplex
