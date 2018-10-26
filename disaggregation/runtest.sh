#!/bin/bash

disaggregationtest()
{
CTRL=ctrl

cd d1
eve 1 1 | getmodel -d | cdftocsv > ../testout/getmodel_$(basename "$PWD").csv
cd ..
cd d2
eve 1 1 | getmodel -d | cdftocsv > ../testout/getmodel_$(basename "$PWD").csv
cd ..
cd d3
eve 1 1 | getmodel -d | cdftocsv > ../testout/getmodel_$(basename "$PWD").csv
cd ..
cd d4
eve 1 1 | getmodel -d | cdftocsv > ../testout/getmodel_$(basename "$PWD").csv
cd ..
cd testout
sha1sum -c ../$CTRL.sha1
	 if [ "$?" -ne "0" ]; then
	   echo "Sorry check failed\n"
	   cd ..
	   return
	 else
	   echo "All tests passed."
	  cd ..
	  return
	 fi
}

disaggregationtest