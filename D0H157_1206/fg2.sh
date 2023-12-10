#!/bin/bash

random(){
	local N=${1:-5}
	local x=${2:-1}
	local y=${3:-90}

	for ((i = 0; i < N; i++)); do
		random_number=$((RANDOM % (y - x + 1) + x))
		echo $random_number
	done
}

echo "10 szám 800 és 900 között:"
random 10 800 900
echo "15 szám -10 és 10 között:"
random 15 -10 10

