#!/bin/bash

# Ellenőrizzük, hogy a nev_id_parok.txt fájl létezik-e
if [ ! -e "nev_id_parok.txt" ]; then
    echo "Hiba: A nev_id_parok.txt fájl nem létezik."
    exit 1
fi

# Felhasználótól bekérjük a nevet
read -p "Kérem adja meg a nevet: " keresett_nev

# Keresés a nev_id_parok.txt fájlban a bemeneti név alapján
id=$(grep "^$keresett_nev:" nev_id_parok.txt | cut -d':' -f2)

# Ellenőrizzük, hogy talált-e egyezést
if [ -z "$id" ]; then
    echo "Nincs találat a(z) \"$keresett_nev\" névvel a nev_id_parok.txt fájlban."
else
    echo "$keresett_nev id-je: $id"
fi
