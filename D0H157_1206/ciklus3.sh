#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Hiba: Nem pozitív szám"
	exit 1
fi

if ! [[ $1 =~ ^[1-9][0-9]*$ ]];
then
	echo "Hiba: Nem szám"
	exit 1
fi

is_prime() {
	num=$1
	for((i = 2; i <= num / 2; i++)); do
		if [ $((num % i)) -eq 0 ]; then
			echo "$num nem prímszám"
			return
		fi
	done
	echo "$num prímszám"
}

is_prime $1
