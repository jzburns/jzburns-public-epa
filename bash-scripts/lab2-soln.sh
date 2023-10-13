#!/bin/bash

cpu_cnt=$(more /proc/cpuinfo | grep processor | wc -l)

# we assume the user has supplied a $1 parameter
if [ $cpu_cnt -lt $1 ]; then
	echo "Not enough CPUs found ($cpu_cnt)"
else
	echo "OK, enough CPUs found ($cpu_cnt)"
fi

