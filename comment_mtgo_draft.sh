#!/bin/bash
# Author: Leonard Tulipan
# Comment a MTGO Draft (recorded with Draft Recorder Option to USERNAME\Documents\Games\Magic The Gathering\Draft\*.txt)

draftlist=$1
cardlist=output_formated_numeric.csv
lines=`wc -l mtgo_draft_recorder.sample.txt |awk '{print $1}'`
i=1

while [ $i -le $lines ]
 do
  line=`head -n $i $draftlist |tail -n 1`
  name=`echo $line|sed 's/^\s\s\s\s//g' |sed 's/-->\s//g'` ;
  echo $name
  i=$[i+1]
done
