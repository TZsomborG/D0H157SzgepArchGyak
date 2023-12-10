#!/bin/bash

# Letöltjük a file1.txt fájlt
wget -O file1.txt https://raw.githubusercontent.com/bbalage/BashExamples/master/assets/file1.txt

# Ellenőrizzük, hogy a letöltés sikeres volt-e
if [ "$?" -ne 0 ]; then
    echo "Hiba történt a file1.txt letöltése során."
    exit 1
fi

# Kinyerjük a valid email címeket a file1.txt fájlból
grep -E -o '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b' file1.txt > emails.txt

# Ellenőrizzük, hogy voltak-e valid email címek a fájlban
if [ ! -s emails.txt ]; then
    echo "Nem találhatóak valid email címek a file1.txt fájlban."
    exit 1
fi

echo "Valid email címek kinyerve az emails.txt fájlba."

# Töröljük az eredetileg letöltött file1.txt fájlt
rm file1.txt

echo "Az eredeti file1.txt fájl törölve."
