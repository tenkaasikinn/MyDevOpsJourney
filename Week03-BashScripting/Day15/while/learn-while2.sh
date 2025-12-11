#!/bin/bash

while read baris; do
	echo "Distro: $baris"
done < file.txt
