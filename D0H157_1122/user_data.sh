#!/bin/bash

# Felhasználótól kérjük be a nevet
read -p "Kérem adja meg a nevet: " nev

# Felhasználótól kérjük be a telefonszámot
read -p "Kérem adja meg a telefonszámot: " telefon

# JSON adatok létrehozása a bekért adatokkal
json_data="{ \"name\" : \"$nev\", \"phone\" : \"$telefon\" }"

# JSON adatok kiírása a neptunkod.json fájlba
echo $json_data > neptunkod.json

echo "Az adatok el lettek mentve a neptunkod.json fájlba."
