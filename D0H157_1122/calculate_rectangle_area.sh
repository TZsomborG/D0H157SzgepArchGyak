#!/bin/bash

# Funkció a téglalap területének kiszámolására
calculate_rectangle_area() {
    local x1=$1
    local y1=$2
    local x2=$3
    local y2=$4

    # A téglalap területének kiszámítása: terület = oldal1 * oldal2
    local side1=$((x2 - x1))
    local side2=$((y2 - y1))
    local area=$((side1 * side2))

    echo "A téglalap területe: $area"
}

# Felhasználótól bekérjük az első pont koordinátáit
read -p "Kérem adja meg az első pont x koordinátáját: " x1
read -p "Kérem adja meg az első pont y koordinátáját: " y1

# Felhasználótól bekérjük a második pont koordinátáit
read -p "Kérem adja meg a második pont x koordinátáját: " x2
read -p "Kérem adja meg a második pont y koordinátáját: " y2

# Ellenőrzés, hogy a koordináták érvényes egész számok-e
if ! [[ $x1 =~ ^[0-9]+$ && $y1 =~ ^[0-9]+$ && $x2 =~ ^[0-9]+$ && $y2 =~ ^[0-9]+$ ]]; then
    echo "Hiba: A koordinátáknak érvényes egész számoknak kell lenniük."
    exit 1
fi

# Terület kiszámítása és kiírása
calculate_rectangle_area "$x1" "$y1" "$x2" "$y2"
