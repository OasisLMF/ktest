#!/bin/bash

init()
{
	CTRL=ctrl
	echo $OSTYPE
	if [[ "$OSTYPE" == "cygwin" ]]; then
		if [ -f /cygdrive/c/Oasis/bin/eve ]; then
		echo 'Running Windows test'
		PATH=/cygdrive/c/Oasis/bin:$PATH
		CTRL=w64ctrl
		else echo 'Running Cygwin test'
		fi
	else echo 'Running Linux test'
	fi
	echo $CTRL
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
	cp ../ftest/fm0/fm_data.bin fm/fm_data.bin
	cp ../ftest/fm0/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm0/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm0/fm_profile.bin fm/fm_profile.bin

	# test eve
	eve 1 1 2 > ../installertest/testout/eveout1_1.bin
	eve 1 2 2 > ../installertest/testout/eveout1_2.bin
	eve 2 1 2 > ../installertest/testout/eveout2_1.bin
	eve 2 2 2 > ../installertest/testout/eveout2_2.bin

	# test getmodel
	eve 1 1 2 | getmodel 1  > ../installertest/testout/getmodelout1_1.bin
	eve 1 2 2 | getmodel 1  > ../installertest/testout/getmodelout1_2.bin
	eve 2 1 2 | getmodel 2  > ../installertest/testout/getmodelout2_1.bin
	eve 2 2 2 | getmodel 2  > ../installertest/testout/getmodelout2_2.bin

	# test gulcalc
	eve 1 1 2 | getmodel 1 | gulcalc -C1 -S100 -R -r > ../installertest/testout/gulcalcout1_1.bin
	eve 1 2 2 | getmodel 1 | gulcalc -C1 -S100 -R -r > ../installertest/testout/gulcalcout1_2.bin
	eve 2 1 2 | getmodel 2 | gulcalc -C1 -S100 -R -r > ../installertest/testout/gulcalcout2_1.bin
	eve 2 2 2 | getmodel 2 | gulcalc -C1 -S100 -R -r > ../installertest/testout/gulcalcout2_2.bin

	# test fmcalc
	eve 1 1 2 | getmodel 1 | gulcalc -C1 -S100 -R -r | fmcalc >  ../installertest/testout/fmcalcout1_1.bin
	# eve 1 1 2 | getmodel 1 | gulcalc -C1 -S100 -R -r | fmcalc_beta >  ../installertest/testout/fmcalcoutbeta1_1.bin

	# test outputcalc
	eve 1 1 1 | getmodel 1 | gulcalc -C1 -S100 -R -r | outputcalc >  ../installertest/testout/gulout1.csv
	eve 1 1 1 | getmodel 1 | gulcalc -C1 -S100 -R -r | fmcalc | outputcalc >  ../installertest/testout/fmout1.csv
	# eve 1 1 1 | getmodel 1 | gulcalc -C1 -S100 -R -r | fmcalc_beta | outputcalc >  ../installertest/testout/fmoutbeta_1.csv

	# test data conversion utilities
	# stdout to csv
	cdftocsv < ../installertest/testout/getmodelout1_1.bin > ../installertest/testout/getmodelout1_1.csv

	gultocsv < ../installertest/testout/gulcalcout1_1.bin > ../installertest/testout/gulcalcout1_1.csv

	fmtocsv < ../installertest/testout/fmcalcout1_1.bin > ../installertest/testout/fmcalcout1_1.csv
	# fmtocsv < ../installertest/testout/fmcalcoutbeta1_1.bin > ../installertest/testout/fmcalcoutbeta1_1.csv

	# input data to csv and bin
	evetocsv < ../examples/e_chunk_1_data.bin > ../installertest/testout/e_chunk_1_data.csv
	evetobin < ../installertest/testout/e_chunk_1_data.csv > ../installertest/testout/e_chunk_1_data.bin

	randtocsv < ../examples/random_1.bin > ../installertest/testout/random_1.csv
	randtobin < ../installertest/testout/random_1.csv | randtocsv > ../installertest/testout/random_12.csv

	exposuretocsv < ../examples/exposures.bin > ../installertest/testout/exposures.csv
	exposuretobin < ../installertest/testout/exposures.csv > ../installertest/testout/exposures.bin

	damagetocsv < ../examples/damage_bin_dict.bin > ../installertest/testout/damage_bin_dict.csv
	damagetobin < ../installertest/testout/damage_bin_dict.csv > ../installertest/testout/damage_bin_dict.bin

	cdfdatatocsv < ../examples/cdf/damage_cdf_chunk_1.bin > ../installertest/testout/damage_cdf_chunk_1.csv

	fmprogrammetocsv < ../examples/fm/fm_programme.bin > ../installertest/testout/fm_programme.csv
	fmprogrammetobin < ../installertest/testout/fm_programme.csv > ../installertest/testout/fm_programme.bin
	
	fmpolicytctocsv < ../examples/fm/fm_policytc.bin > ../installertest/testout/fm_policytc.csv
	fmpolicytctobin < ../installertest/testout/fm_policytc.csv > ../installertest/testout/fm_policytc.bin

	fmprofiletocsv < ../examples/fm/fm_profile.bin > ../installertest/testout/fm_profile.csv
	fmprofiletobin < ../installertest/testout/fm_profile.csv > ../installertest/testout/fm_profile.bin

	fmxreftocsv < ../examples/fm/fmxref.bin > ../installertest/testout/fmxref.csv
	fmxreftobin < ../installertest/testout/fmxref.csv > ../installertest/testout/fmxref.bin

	cd ../installertest/testout
	cdfdatatobin damage_cdf_chunk_11 102 < damage_cdf_chunk_1.csv
	cdfdatatocsv < damage_cdf_chunk_11.bin > damage_cdf_chunk_11.csv

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
	cp ../ftest/fm0/fm_data.bin fm/fm_data.bin
	cp ../ftest/fm0/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm0/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm0/fm_profile.bin fm/fm_profile.bin
		
	eve 1 1 1 | getmodel 1 | gulcalc -C1 -S100 -r -R > ../ftest/testout/gul_c1.bin
	eve 2 1 1 | getmodel 2 | gulcalc -C2 -S100 -r -R > ../ftest/testout/gul_c2.bin
	# Run fm0
	cp ../ftest/fm0/fm_data.bin fm/fm_data.bin
	cp ../ftest/fm0/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm0/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm0/fm_profile.bin fm/fm_profile.bin
	#fmcalc1 < ../ftest/testout/gul_c1.bin | fmtocsv > ../ftest/testout/fm0_c1.csv
	#fmcalc1 < ../ftest/testout/gul_c2.bin | fmtocsv > ../ftest/testout/fm0_c2.csv
	fmcalc < ../ftest/testout/gul_c1.bin | fmtocsv > ../ftest/testout/fmbeta0_c1.csv
	fmcalc < ../ftest/testout/gul_c2.bin | fmtocsv > ../ftest/testout/fmbeta0_c2.csv
	# Run fm1
	cp ../ftest/fm1/fm_data.bin fm/fm_data.bin
	cp ../ftest/fm1/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm1/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm1/fm_profile.bin fm/fm_profile.bin
	#fmcalc1 < ../ftest/testout/gul_c1.bin  > ../ftest/testout/fm1_c1.bin
	#fmcalc1 < ../ftest/testout/gul_c2.bin  > ../ftest/testout/fm1_c2.bin
	fmcalc < ../ftest/testout/gul_c1.bin  > ../ftest/testout/fmbeta1_c1.bin
	fmcalc < ../ftest/testout/gul_c2.bin  > ../ftest/testout/fmbeta1_c2.bin
	# Run fm2 
	cp ../ftest/fm2/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm2/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm2/fm_profile.bin fm/fm_profile.bin
	fmcalc < ../ftest/testout/gul_c1.bin  > ../ftest/testout/fmbeta2_c1.bin
	fmcalc < ../ftest/testout/gul_c2.bin  > ../ftest/testout/fmbeta2_c2.bin
	# Run fm3
	cp ../ftest/fm3/fm_data.bin fm/fm_data.bin
	cp ../ftest/fm3/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm3/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm3/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm3/guls.bin .
	#fmcalc1 < guls.bin | fmtocsv > ../ftest/testout/fm3.csv
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta3.csv
	# Run fm4
	cp ../ftest/fm4/fm_data.bin fm/fm_data.bin
	cp ../ftest/fm4/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm4/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm4/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm4/guls.bin .
	#fmcalc1 < guls.bin | fmtocsv > ../ftest/testout/fm4.csv
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta4.csv
	# Run fm5
	cp ../ftest/fm5/fm_data.bin fm/fm_data.bin
	cp ../ftest/fm5/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm5/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm5/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm5/guls.bin .
	#fmcalc1 < guls.bin | fmtocsv > ../ftest/testout/fm5.csv
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta5.csv
	# Run fm6
	cp ../ftest/fm6/fm_data.bin fm/fm_data.bin
	cp ../ftest/fm6/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm6/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm6/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm6/guls.bin .
	#fmcalc1 < guls.bin | fmtocsv > ../ftest/testout/fm6.csv
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta6.csv
	# Run fm7
	cp ../ftest/fm7/fm_data.bin fm/fm_data.bin
	cp ../ftest/fm7/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm7/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm7/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm7/guls.bin .
	#fmcalc1 < guls.bin | fmtocsv > ../ftest/testout/fm7.csv
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta7.csv
	# Run fm8
	cp ../ftest/fm8/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm8/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm8/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm8/guls.bin .
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta8.csv
	# Run fm9
	cp ../ftest/fm9/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm9/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm9/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm9/guls.bin .
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta9.csv
	# Run fm10
	cp ../ftest/fm10/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm10/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm10/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm10/guls.bin .
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta10.csv
	# Run fm11
	cp ../ftest/fm11/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm11/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm11/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm11/guls.bin .
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta11.csv
	# Run fm12
	cp ../ftest/fm12/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm12/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm12/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm12/guls.bin .
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta12.csv
	cp ../ftest/fm12/fm_profile_alloc.bin fm/fm_profile.bin
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta12_alloc.csv
	# Run fm13
	cp ../ftest/fm13/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm13/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm13/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm13/guls.bin .
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta13.csv
	# Run fm14
	cp ../ftest/fm14/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm14/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm14/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm14/guls.bin .
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta14.csv
	# Run fm15
	cp ../ftest/fm15/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm15/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm15/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm15/guls.bin .
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta15.csv
	# Run fm16
	cp ../ftest/fm16/fm_programme.bin fm/fm_programme.bin
	cp ../ftest/fm16/fm_policytc.bin fm/fm_policytc.bin
	cp ../ftest/fm16/fm_profile.bin fm/fm_profile.bin
	cp ../ftest/fm16/guls.bin .
	fmcalc < guls.bin | fmtocsv > ../ftest/testout/fmbeta16.csv
	cd ../ftest/testout
	md5sum -c ../$CTRL.md5

	if [ "$?" -ne "0" ]; then
	  echo "Sorry check failed\n"
	  exit 1
	else
	  echo "FM tests passed.\n"
	# exit 0
	fi

	rm *
	cd ../..

}

multiplex()
{
	tmp_dir=$(mktemp -d)
	mkfifo "$tmp_dir/f1" "$tmp_dir/f2" "$tmp_dir/f3"
	gultocsv <"$tmp_dir/f1" > "gulzz.csv" & pid1=$!
	fmtocsv <"$tmp_dir/f2" > "fmcalc_beta.csv" & pid2=$!
	cat <"$tmp_dir/f3" > "gulzz.bin" & pid3=$!
	cd examples
	eve 1 1 1 | getmodel 1 | gulcalc -C1 -S100 -r -R |	tee "$tmp_dir/f1" tee "$tmp_dir/f3"  | fmcalc_beta | tee "$tmp_dir/f2" > ../fmcalcbeta.bin
	rm -rf "$tmp_dir"
	wait $pid1 $pid2 $pid3
}

init
installertest
ftest
#multiplex
