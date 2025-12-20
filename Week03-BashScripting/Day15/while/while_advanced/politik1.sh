#!/bin/bash

count=1
for i in "$@"; do
	echo "${count}. $i"
	((count++))
done
