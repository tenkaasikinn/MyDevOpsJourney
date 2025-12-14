#!/bin/bash

count=1
while IFS= read -r line; do
	[[ -z "$line" ]] && continue
	echo "$count $line"
	((count++))
done < list.txt

