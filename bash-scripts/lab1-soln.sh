#!/bin/bash

proc_cnt=$(ps -ef | wc -l)

# we assume the user has supplied a $1 parameter
if [ $proc_cnt -lt $1 ]; then
	echo "Maximum number of process NOT exceeded ($proc_cnt)"
else
	echo "Maximum number of process exceeded ($proc_cnt)"
fi

