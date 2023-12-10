#!/bin/bash

# Bemeneti név
keresett_nev=$1

# Keresés a people.csv fájlban a bemeneti név alapján
szuletesi_datum=$(awk -F';' -v nev="$keresett_nev" '$1 == nev {print $2}' people.csv)

# Ellenőrizzük, hogy talált-e egyezést
if [ -z "$szuletesi_datum" ]; then
    echo "Nincs találat a(z) \"$keresett_nev\" nevű személyre a people.csv fájlban."
else
    # Születési dátum formátumának ellenőrzése
    if [[ $szuletesi_datum =~ ^[0-9]{4}\.[0-9]{2}\.[0-9]{2}\.$ ]]; then
        # Kiszámoljuk az életkort
        szuletesi_ev=$(echo "$szuletesi_datum" | cut -d'.' -f1)
        jelenlegi_ev=$(date +"%Y")
        eletkor=$((jelenlegi_ev - szuletesi_ev))

        echo "$keresett_nev született: $szuletesi_datum, életkora: $eletkor év."
    else
        echo "Hiba: Hibás születési dátum formátum a people.csv fájlban."
        exit 1
    fi
fi
