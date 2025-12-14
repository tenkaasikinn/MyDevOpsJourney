#!/bin/bash

for i in {1..6}; do
	if (( i % 3 == 0 )); then
		continue
	fi

	echo "angka $i"
done
