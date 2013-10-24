#!/bin/bash
# Author: Leonard Tulipan
# Comment a MTGO Draft (recorded with Draft Recorder Option to USERNAME\Documents\Games\Magic The Gathering\Draft\*.txt)

draftlist=$1
cardlist=output_formated_numeric.csv

name=`head -n 29 $draftlist |tail -n 1|sed 's/^\s\s\s\s//g' |sed 's/-->\s//g'` ;
echo $name
