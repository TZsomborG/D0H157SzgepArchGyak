#!/bin/bash

# Véletlen szám generálása 1 és 100 között
random_number=$((RANDOM % 100 + 1))

echo "Véletlen szám: $random_number"
echo "Nála kisebb négyzetszámok:"

# Kisebb négyzetszámok kiírása
for ((i=1; i*i<$random_number; i++)); do
    echo $((i*i))
done
