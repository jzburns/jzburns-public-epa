#!/bin/bash

for a in {1..5}; do
	echo $a
done

## alternative arrangement
## note we can use shell expansions here, 
## functions like seq, ps, ls etc
## any function can be expanded here
for a in $(seq 1 5); do
	echo $a
done
