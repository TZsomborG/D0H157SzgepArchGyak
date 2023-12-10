#!/bin/bash

# Funkció a téglalap területének kiszámolására
calculate_rectangle_area() {
    local oldal1=$1
    local oldal2=$2

    # Terület kiszámítása: terület = oldal1 * oldal2
    local terulet=$(echo "$oldal1 * $oldal2" | bc)

    echo "A téglalap területe: $terulet"
}

# Ellenőrizzük, hogy legalább két bemeneti paramétert megadtak-e
if [ "$#" -ne 2 ]; then
    echo "Használat: $0 <oldal1> <oldal2>"
    exit 1
fi

# Bemeneti oldalak
oldal1=$1
oldal2=$2

# Ellenőrizzük, hogy a bemeneti értékek számok-e
if ! [[ $oldal1 =~ ^[0-9.]+$ && $oldal2 =~ ^[0-9.]+$ ]]; then
    echo "Hiba: Mindkét oldalnak számnak kell lennie."
    exit 1
fi

# Téglalap területének kiszámítása és kiírása
calculate_rectangle_area "$oldal1" "$oldal2"
