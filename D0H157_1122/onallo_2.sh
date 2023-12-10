#!/bin/bash

# Ellenőrizzük, hogy legalább két bemeneti paramétert megadtak-e
if [ "$#" -ne 1 ]; then
    echo "Használat: $0 <fájlnév>"
    exit 1
fi

# Bemeneti fájl név
fajlnev=$1

# Ellenőrizzük, hogy a fájl létezik és olvasható-e
if [ ! -r "$fajlnev" ]; then
    echo "Hiba: A fájl nem létezik vagy nem olvasható."
    exit 1
fi

# Felhasználótól bekérjük a nevet
read -p "Kérem adja meg a nevet: " keresett_nev

# Keresés a bemeneti fájlban a bemeneti név alapján
id=$(grep "^$keresett_nev:" "$fajlnev" | cut -d':' -f2)

# Ellenőrizzük, hogy talált-e egyezést
if [ -z "$id" ]; then
    echo "Nincs találat a(z) \"$keresett_nev\" névvel a $fajlnev fájlban."
else
    echo "$keresett_nev id-je: $id"
fi
