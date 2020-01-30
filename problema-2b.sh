#!/bin/bash

cut -d$'\t' -f4 UFO-Nov-Dic-2014.tsv  | sed '/^$/d'  | sort -k 1 | uniq -c  | sort -n -r | grep -vE "Circle|Sphere|Oval|Disk|Egg|Shape" >> problema-2b.sh

awk -F, '{sum +=$1} END {print "Avistamientos que NO tienen forma de esferoide: " sum;}' problema-2b.sh >> problema-2b.sh

exit

