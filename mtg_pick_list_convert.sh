#!/bin/bash
# Author: Leonard Tulipan
# Desc: This script downloads the Pick Order List (currently only Theros Draft) from channelfireball
#       it then converts it, so that you get a text/csv file usable for further processing


if [ ! -f frank.html ]
 then
   wget -O - http://www.channelfireball.com/articles/frank-analysis-a-pick-order-list-for-theros-draft/ > frank.html
fi

#Split Files at Headings - start with 101 for soting purposes
if [ ! -f section100.html ]
 then
   awk 'BEGIN { file = "/dev/null"; i=100} /<p><b>[a-zA-Z]/ {file="section"(++i)".html" } {print > file}' frank.html
fi

for section in section1*
 do
  headline=`head -n 1 $section  | sed 's/<\/*p>//g'|sed 's/<\/*b>//g'| sed 's/://g' | sed "s/&#8217;/\'/g"`
  tidy -ucbq --omit $section 2> /dev/null | awk -v hl="$headline" -F "'" 'BEGIN{num=1} /alt=/ { print num++";"$2";"hl}' | sed "s/&#8217;/\'/g" | sed "s/&amp;#8217;/\'/g"
done

# Remove Temp-Files
# rm frank.html section1*.html
