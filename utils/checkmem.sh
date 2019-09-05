#!/bin/bash

# sample code to demo memory usage monitoring by process

gedit &

PID=$!

kill -0 $PID

ret=$?


while [ $ret -eq 0 ]
do
	pmap $PID | grep total
	sleep 2
	kill -0 $PID 2> /dev/null
	ret=$?
done