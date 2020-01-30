#!/bin/bash

#rm time-ufo.txt
cut -d$'\t' -f5 UFO-Nov-Dic-2014.tsv | sed '/^$/d' | sed '/^.*[0-9].*$/!d' | tr -d '~'  > time-ufo.txt

#Obtiene la suma y el promedio
awk -v sum_sec=0 -v sum_min=0 -v sum_hrs=0 '{if($2== "seconds"){sum_sec += $1}else if($2=="minute" || $2=="minutes" || $2=="min"){sum_min += $1}else if($2=="hour" || $2=="hours"){sum_hrs += $1}else{sum_otro += $1}} END {print "suma de segundos: " sum_sec, "\nsuma de minutos: " sum_min, "\nsuma de horas: " sum_hrs, "\n\npromedio de segundos: " (sum_sec/NR), "\npromedio de minutos: " (sum_min/NR), "\npromedio de horas: " (sum_hrs/NR) }' time-ufo.txt

#Obtiene los Max
grep -wE 'seconds' time-ufo.txt |sort -n -r | awk 'NR==1{print "\nmax de segundos: " $1}' 
grep -wE 'minutes' time-ufo.txt |sort -n -r | awk 'NR==1{print "max de minutos: " $1}'
grep -wE 'hours' time-ufo.txt |sort -n -r | awk 'NR==1{print "max de horas: " $1}'

#Obtiene los minimos
grep -wE 'seconds' time-ufo.txt |sort -n | awk 'NR==1{print "\nmin de segundos: " $1}'
grep -wE 'minutes' time-ufo.txt |sort -n | awk 'NR==1{print "min de minutes: " $1}'
grep -wE 'hours' time-ufo.txt |sort -n | awk 'NR==1{print "min de horas: " $1}'


