#!/bin/bash

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

multiplex