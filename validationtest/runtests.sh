#!/bin/bash

main()
{
	mkdir testout
	CTRL=ctrl

	# Loop over all csv files in static directory and create stderr (err)
	# files
	# Damage bin dict
	for filename in static/damage_bin_dict*.csv; do
		base=$(basename -s .csv "$filename")
		validatedamagebin < static/$base.csv 2>testout/$base.err
	done
	# Footprint
	for filename in static/footprint*.csv; do
		base=$(basename -s .csv "$filename")
		validatefootprint < static/$base.csv 2>testout/$base.err
	done

	# Conduct MD5 checksum on generated files
	cd testout
	md5sum -c ../$CTRL.md5

	if [ "$?" -ne "0" ]; then
		echo "Sorry check failed."
	else
		echo "Validation tests passed."
	fi

	cd ../
}

main
