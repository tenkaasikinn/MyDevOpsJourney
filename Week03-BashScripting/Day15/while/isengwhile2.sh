#!/bin/bash

count=1
while read aca; do
	echo "$count $aca"
	((count++))
done < academic.txt
