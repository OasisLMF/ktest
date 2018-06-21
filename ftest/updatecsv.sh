#!/bin/bash

main()
{
	TEST = 0
	for TEST in {0..22};
	do
	fmprogrammetocsv < fm$TEST/input/fm_programme.bin > data/fm$TEST/input/fm_programme.csv
	fmpolicytctocsv < fm$TEST/input/fm_policytc.bin > data/fm$TEST/input/fm_policytc.csv
	fmprofiletocsv < fm$TEST/input/fm_profile.bin > data/fm$TEST/input/fm_profile.csv
	fmxreftocsv < fm$TEST/input/fm_xref.bin > data/fm$TEST/input/fm_xref.csv
	itemtocsv < fm$TEST/input/items.bin > data/fm$TEST/input/items.csv
	coveragetocsv < fm$TEST/input/coverages.bin > data/fm$TEST/input/coverages.csv
	done

}

main