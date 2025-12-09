#!/bin/bash

count=1
for d in "$@"; do
	echo "$count. $d"
	((count++))
done

echo "Jumlahnya ada $#"
