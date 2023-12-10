#!/bin/bash
output_file="out.txt"
# Ellenőrizzük, hogy legalább egy bemeneti paramétert megadtak-e
if [ "$#" -lt 1 ]; then
    echo "Használat: $0 input.txt"
    exit 1
fi

# Bemeneti fájl neve a paraméterből
input_file="$1"

# Ellenőrizzük, hogy a fájl létezik-e
if [ ! -e "$input_file" ]; then
    echo "A megadott fájl nem létezik: $input_file"
    exit 1
fi

# Szövegcserét végzünk és az eredményt kiírjuk az out.txt fájlba
sed 's/happy/nem gondoltam a vizsgaidőszakra/g' "$input_file" > "$output_file"

printf "A happy szó minden előfordulását lecseréltük a vizsgaidőszakra az out.txt fájlba.\n"
printf "Input: %s\n" "$(cat "$input_file")"
printf "Output: %s\n" "$(cat "$output_file")"