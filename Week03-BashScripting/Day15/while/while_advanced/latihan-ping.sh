#!/bin/bash

count=1
while ! ping -c 1 -W 1 google.com > /dev/null 2>&1; do
	echo "Percobaan koneksi ke $count"
	((count++))
	if [[ "$count" -gt 5 ]]; then
		echo "Koneksi gagal"
		exit 1
	fi
	sleep 1
done
echo "Koneksi berhasil"
