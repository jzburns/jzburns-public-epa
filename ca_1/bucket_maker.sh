#!/bin/bash

if [ -z $1 ]; then
	exit 1
fi
	
bucket_maker() {
	for c in {1..5}; do
		gsutil mb gs://$1$c 2>/dev/null
		if [ $? -lt 1 ]; then
			echo "Bucket Maker succeeded using gs://$1$c ... finished"
			exit 0
		else
			echo "Bucket Maker failed using gs://$1$c"
		fi
	done
	exit 1
}

gsutil mb gs://$1 2>/dev/null

if [ $? -gt 0 ]; then
	echo "Bucket Maker failed for gs://$1 ... entering loop"
	bucket_maker $1
else
	echo "Bucket Maker successful using gs://$1 ... finished"	
	exit 0
fi
