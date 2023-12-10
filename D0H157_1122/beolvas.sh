#!/bin/bash

# Ellenőrizzük, hogy legalább két bemeneti paramétert megadtak-e
if [ "$#" -lt 2 ]; then
    echo "Két számra van szükség!"
    exit 1
fi

# Bemeneti számok beolvasása
szam1=$1
szam2=$2

# Számokkal végzett műveletek
osszeg=$((szam1 + szam2))
kulonbseg=$((szam1 - szam2))
szorzat=$((szam1 * szam2))

# Ellenőrzés, hogy a második szám ne legyen 0, mert nem lehet nullával osztani
if [ "$szam2" -eq 0 ]; then
    echo "A második szám nem lehet 0, mert nem lehet nullával osztani."
    exit 1
fi

hanyados=$((szam1 / szam2))
osztasi_maradek=$((szam1 % szam2))

# Eredmények kiírása
echo "Összeg: $osszeg"
echo "Különbség: $kulonbseg"
echo "Szorzat: $szorzat"
echo "Hányados: $hanyados"
echo "Osztási maradék: $osztasi_maradek"
