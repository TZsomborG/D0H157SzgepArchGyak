#!/bin/bash

sum_numbers(){
	local sum=0
	for arg in "$@"; do
		sum=$((sum+arg))
	done
	echo "Összeg: $sum"
}

if [ "$#" -eq 0 ]; then
	echo "Összeg: 0"
else
	sum_numbers "$@"
fi

