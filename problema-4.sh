#!/bin/bash

BASE_URL="http://www.nuforc.org/webreports/ndxe"


function extract_table() {
    sed -n '/<TABLE .*>/,/<\/TABLE>/p' $1  | sed  's/<[^>]*>\n//g'
}

# "${BASE_URL}"{1960..2019}{01..12}

function load_data() {
    for url in "${BASE_URL}"{1960..2019}{01..12}".html"
    do
        echo ${url}
        filename=`basename "$url"`
        curl -#J ${url} | extract_table > $filename
    done
}

function clean_data(){
    tr '[:upper:]' '[:lower:]' < $1 | tr '\t' '|'    
}

function concat_data(){
    for year in {1960..2019}
    do
        for month in {01..12}
        do
           clean_data ndxe$year$month.html | sed -n '/http:/,/http:/p' >> dataUFO/UFO-$year.txt 
        done
    done
}

load_data
concat_data
