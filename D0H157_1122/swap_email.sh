#!/bin/bash

# Kicseréljük a gmail-es e-mail címeket citromail-esre és kiírjuk a neptunkod_people.csv fájlba
awk -F',' 'BEGIN {OFS=","} {if ($1=="email") print; else gsub(/@gmail\.com/, "@citromail.com", $1); print}' people1.csv > neptunkod_people.csv

echo "Az e-mail címek cseréje megtörtént. Az eredményt a neptunkod_people.csv fájlban találod."
