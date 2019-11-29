#!/bin/sh
isbn=$1
# xargs to remove spaces
curl -s "https://catalog.loc.gov/vwebv/search?searchArg=${isbn}&searchCode=GKEY%5E*&searchType=0&recCount=25" | grep -i -A 3 Dewey | tail -n 1 |  sed -e 's/<[^>]*>//g' | xargs
