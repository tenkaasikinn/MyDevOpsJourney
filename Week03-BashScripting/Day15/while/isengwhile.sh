#!/bin/bash

count=1
while read distro; do
	echo "$count $distro"
	count=$((count+1))
done < 'distro linux gua.txt'
