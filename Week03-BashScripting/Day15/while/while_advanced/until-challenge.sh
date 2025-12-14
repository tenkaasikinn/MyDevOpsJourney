#!/bin/bash

count=1
until (( count > 3 )); do
	echo "Loop ke $count"
	((count++))
done
