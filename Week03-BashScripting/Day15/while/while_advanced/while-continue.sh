#!/bin/bash

for i in {1..10}; do
	if (( i % 2 == 0 )); then
		continue
	fi

	echo "angka $i"
done
