#!/bin/bash
# Author: Leonard Tulipan
# Desc: This script downloads the Pick Order List (currently only Theros Draft) from channelfireball
#       it then converts it, so that you get a text/csv file usable for further processing


if [ ~ -f frank.html]
 then
   wget -O - http://www.channelfireball.com/articles/frank-analysis-a-pick-order-list-for-theros-draft/ > frank.html
fi

#Split Files at Headings
awk 'BEGIN { file = "/dev/null"} /<p><b>[a-zA-Z]/ {file="section"(++i)".html" } {print > file}' frank.html

tidy -ucbq --omit section1.html 2> /dev/null

