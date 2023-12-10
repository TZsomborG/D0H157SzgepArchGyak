#!/bin/bash

calculate_age() {
    IFS='.' read -r by bm bd <<< "$1"
    IFS='.' read -r cy cm cd <<< "$(date +'%Y.%m.%d')"

    # Átváltás 10-es számrendszerbe
    by=$((10#$by))
    bm=$((10#$bm))
    bd=$((10#$bd))
    cy=$((10#$cy))
    cm=$((10#$cm))
    cd=$((10#$cd))

    age=$((cy - by - (cm < bm || (cm == bm && cd < bd))))
    echo "$age"
}

# Bekéri a felhasználó születési dátumát és ellenőrzi a helyességét
while true; do
    read -p "Adja meg a születési dátumát 'ÉÉÉÉ.HH.NN' formátumban: " szuletesi_datum

    if [[ ! $szuletesi_datum =~ ^[0-9]{4}\.[0-9]{2}\.[0-9]{2}$ ]]; then
        echo "Hiba: Helytelen formátum. Kérjük, használja az 'ÉÉÉÉ.HH.NN' formátumot."
    else
        break
    fi
done

eletkor=$(calculate_age "$szuletesi_datum")

echo "Az életkora: $eletkor év."
