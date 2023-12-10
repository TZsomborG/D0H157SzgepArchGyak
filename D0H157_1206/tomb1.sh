#!/bin/bash

# Tömb létrehozása és feltöltése véletlen számokkal
declare -a numbers
for ((i=0; i<10; i++)); do
    numbers[$i]=$((RANDOM % 100))
done

echo "Eredeti tömb: ${numbers[@]}"

# Minden elem növelése 1-gyel
for ((i=0; i<10; i++)); do
    numbers[$i]=$((numbers[$i] + 1))
done

echo "Növelt tömb: ${numbers[@]}"
