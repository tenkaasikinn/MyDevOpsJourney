#!/bin/bash

while IFS= read -r target; do
	echo "cek $target"
	ping -c 1 -W 2 "$target" > /dev/null 2>&1 \
		&& echo "Koneksi Tersambung" || echo "Koneksi Terputus"
done < target.txt
