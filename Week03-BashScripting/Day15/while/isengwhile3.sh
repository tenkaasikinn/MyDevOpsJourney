#!/bin/bash

count=1
while ! ping -c 1 -W 1 google.com > /dev/null 2>&1; do
	echo "Sedang mencoba menghubungkan $count"
	((count++))
	[[ "$count" -gt 5 ]] && echo "Gagal menghubungkan" && exit 1
	sleep 1
done
echo "Terhubung ke jaringan"
