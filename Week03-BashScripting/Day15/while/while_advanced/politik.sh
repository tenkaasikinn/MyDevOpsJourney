#!/bin/bash

while IFS= read -r baca; do
	echo "$baca"
done < politik.txt
