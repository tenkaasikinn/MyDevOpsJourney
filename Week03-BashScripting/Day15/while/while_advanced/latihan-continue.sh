#!/bin/bash

for i in {1..10}; do
	if (( i % 5 == 0 )); then
		continue
	fi

	echo "angka $i"
done
