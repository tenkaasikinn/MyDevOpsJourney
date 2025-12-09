#!/bin/bash

while IFS= read -r target; do
	echo "Check Koneksi Internet $target"
	ping -c 1 -W 1 "$target" > /dev/null 2>&1 \
		&& echo "Koneksi tersambung" || echo "Koneksi putus"
done < target.txt
