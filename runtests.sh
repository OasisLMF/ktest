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
}

installertest()
{
    echo 'Running installer test'
    cd installertest	
	sh runtests.sh
	cd ..
}

ftest()
{
	echo 'Running fm test'
	cd ftest
	sh runtests.sh
	cd ..
}

init
installertest
ftest

