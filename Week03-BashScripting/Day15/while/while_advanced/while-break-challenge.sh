#!/bin/bash

count=1
while (( count <= 10 )); do
	echo "Hitungan ke $count"

	if (( count == 3 )); then
		break
	fi

	((count++))
done

