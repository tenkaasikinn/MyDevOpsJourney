#!/bin/bash

count=1
while ! ping -c 1 -W 1 google.com > /dev/null 2>&1; do
	echo "Sedang menghubungkan ke jaringan percobaan ke $count" 
	((count++))
	if [[ "$count" -gt 5 ]]; then
		echo "Koneksi gagal"
		exit 1
	fi
	sleep 1
done
echo "berhasil terkoneksi"
