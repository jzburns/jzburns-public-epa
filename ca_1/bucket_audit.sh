#!/bin/bash

useage_function() {
  echo $0 FIRST_STRING SECOND_STRING THIRD_STRING
}

if [ -z $1 ]; then
	useage_function
	exit 1
fi
	
if [ -z $2 ]; then
	useage_function
	exit 1
fi


if [ -z $3 ]; then
	useage_function
	exit 1
fi

bucket_audit() {
	gsutil ls gs://$1 2>/dev/null
	if [ $? -eq 0 ]; then
		echo "Bucket naming policy violation with $1"
	else 
		echo "No bucket naming policy violation with $1"
	fi
}

bucket_audit $1
bucket_audit $2
bucket_audit $3
