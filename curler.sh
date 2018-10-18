#!/bin/bash

while read line;
do
	dest=$(echo $line | awk '{ print $11 }' | cut -c 5-)
	echo -n $dest " "
#	echo -n $line >> file.txt
	curl -s "ipinfo.io/$dest" | grep org | cut -c 10- 
done<trail.log
