#!/bin/bash
#Convert the input data
aggregateitemtobin < input/aggregate_items.csv > input/aggregate_items.bin
#Run the standard getmodel to get the individual damage curves
itemtobin < input/items_standard.csv > input/items.bin
eve 1 1 | getmodel | cdftocsv > getmodel.csv
# Run getmodel in disaggregated mode to get the blended curve
itemtobin < input/items_disaggregated.csv > input/items.bin
eve 1 1 | getmodel -d | cdftocsv > getmodeld.csv
