#!/bin/bash
# Beolvasás
read -p "Add meg az elemek számát (N): " N

# Ellenőrzés
if ! [[ $N =~ ^[1-9][0-9]*$ ]];
then
	echo "Hibás megadott érték"
	exit 1
fi

declare -a myArray

for ((i = 0; i < N; i++)); do
	myArray[$i]=$((RANDOM % 100 + 1))
done

echo "Eredeti tömb: ${myArray[@]}"

max_element=${myArray[0]}
for element in "${myArray[@]}"; do
	((element > max_element)) && max_element=$element
done
echo "Legnagyobb érték: $max_element"

min_element=${myArray[0]}
for element in "${myArray[@]}"; do
	((element < min_element)) && min_element=$element
done
echo "Legkisebb érték: $min_element"

sum=0
for element in "${myArray[@]}"; do
	sum=$((sum + element))
done
echo "A tömb összege: $sum"

average=$(echo "scale=2; $sum / $N" | bc)
echo "A tömb áltaga: $average"
