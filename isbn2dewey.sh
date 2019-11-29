#!/bin/sh
#set -vx
isbn=$1
result=`curl -s "https://catalog.loc.gov/vwebv/search?searchArg=${isbn}&searchCode=GKEY%5E*&searchType=0&recCount=25"`
call_number=`echo "${result}" | grep -i -A 3 Dewey | tail -n 1 | sed -e 's/<[^>]*>//g' | sed -e 's/^[[:space:]]*//'`
title=`echo "${result}" | grep -i -A 3 'Main title' | tail -n 1 | sed -e 's/<[^>]*>//g' | sed -e 's/^[[:space:]]*//'`
echo "${call_number} - ${title}"
