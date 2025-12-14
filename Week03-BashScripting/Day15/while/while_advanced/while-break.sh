#!/bin/bash

count=1

while ((count <= 10 )); do
	echo "Loop $count"

	if ((count == 5 )); then
	       break
	fi
	((count++))
done	

