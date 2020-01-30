#!/bin/bash

< UFO-Nov-Dic-2014.tsv cut -d$'\t' -f3 | sed '/^$/d' | sed '/.\{3\}/d' | sort -k 2 | uniq -c  | sort -n -r >> problema-2a.sh

exit

