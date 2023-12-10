#!/bin/bash

FILE="gtfs.zip"
URL="https://gtfsapi.mvkzrt.hu/gtfs/gtfs.zip"
DIR="${FILE%.*}"

# Function to download and extract the GTFS file
download_and_extract_gtfs() {
  echo "Letöltjük a $FILE fájlt a $URL címről..."
  wget "$URL" && unzip -o "$FILE" -d "$DIR"
}

# Function to check if a directory exists and clear its contents
check_and_clear_directory() {
  if [ -d "$1" ]; then
    echo "A $1 mappa már létezik, töröljük a tartalmát..."
    rm -r "$1"/*
  else
    echo "A $1 mappa még nem létezik, létrehozzuk..."
    mkdir "$1"
  fi
}

# Check if the GTFS file already exists and download/extract if necessary
if [ -f "$FILE" ]; then
  echo "A $FILE fájl már létezik, töröljük..."
  rm "$FILE"
fi

check_and_clear_directory "$DIR"

# Check if the download and extraction were successful
if [ $? -eq 0 ]; then
  download_and_extract_gtfs

  echo "Adjon meg egy megállót (Búza tér, Repülőtér): "
  read STOP_NAME

  if grep -qF "$STOP_NAME" "$DIR/routes.txt"; then
    INFO=$(awk -F ',' -v search="$STOP_NAME" '$0 ~ search {gsub(/^[^,]*,[^,]*,/, "", $0); print $0}' "$DIR/routes.txt")

    IFS=$'\n' read -d '' -ra MEGALLO_ARRAY <<< "$(echo "$INFO" | cut -d ',' -f 2)"
    IFS=$'\n' read -d '' -ra BUSZ_SZAM_ARRAY <<< "$(echo "$INFO" | cut -d ',' -f 1)"

    BEFORE_STOP=()
    AFTER_STOP=()

    for ((i=0; i<${#MEGALLO_ARRAY[@]}; i++)); do
      STOP_POSITION=$(awk -F' - ' -v search="$STOP_NAME" '{print index($0, search)}' <<< "${MEGALLO_ARRAY[i]}")
      if (( STOP_POSITION > 1 )); then
        BEFORE_STOP+=(" - ${MEGALLO_ARRAY[i]} - (${BUSZ_SZAM_ARRAY[i]})")
      else
        AFTER_STOP+=(" - ${MEGALLO_ARRAY[i]} - (${BUSZ_SZAM_ARRAY[i]})")
      fi
    done

    echo "Járatok amik innen indulnak:"
    for entry in "${AFTER_STOP[@]}"; do
      echo "$entry"
    done

    echo "Járatok amik ide mennek:"
    for entry in "${BEFORE_STOP[@]}"; do
      echo "$entry"
    done

  else
    echo "A megadott megállóhoz nincs járat az adatbázisban."
  fi
else
  echo "A letöltés vagy a kitömörítés sikertelen volt, nem tudjuk bekérni a megállót..."
fi
