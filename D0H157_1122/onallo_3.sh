#!/bin/bash

if [ -e gtfs.zip ]; then
    	rm gtfs.zip
fi

if [ -d gtfs ]; then
    	rm -r gtfs
fi

wget "https://gtfsapi.mvkzrt.hu/gtfs/gtfs.zip"
unzip gtfs.zip -d gtfs

vegallomas=$1
talalat=$(cat gtfs/routes.txt | grep "$vegallomas")

if [ -n "$talalat"]; then
  echo "$talalat"
else
  echo "Hiba: Nincs találat!"
fi