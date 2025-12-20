#!/bin/bash

count=1
while IFS= read -r list; do
	echo "${count}. $list"
	((count++))
done < list-distro.txt

