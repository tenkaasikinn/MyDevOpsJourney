#!/bin/bash

count=1
until (( count > 3 )); do
	echo "Hitungan ke $count"
	((count++))
done
