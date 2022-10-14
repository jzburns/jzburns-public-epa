#!/bin/bash

if [ -z $1 ]; then
	exit 1
fi
	
bucket_maker() {
	for c in {1..5}; do
		gsutil mb gs://$1$c 2>/dev/null
		if [ $? -lt 1 ]; then
			echo "bucket maker worked using gs://$1$c"
			exit 0
		else
			echo "bucket maker failed using gs://$1$c"
		fi
	done
	exit 1
}

gsutil mb gs://$1 2>/dev/null

if [ $? -gt 0 ]; then
	echo "Bucket make failed for gs://$1 ... tryng loop"
	bucket_maker $1
else
	echo "bucket maker successful using gs://$1"	
	exit 0
fi
