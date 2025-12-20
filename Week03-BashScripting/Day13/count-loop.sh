#!/usr/bin/env bash

name="Tenka"

echo "Halo, Nama saya $name"
echo
echo "Laptop yang saya gunakan adalah Toshiba A665"
echo 
echo "Waktu yang saya pakai di Laptop hari ini"
uptime -p
echo "Distro Linux yang saya gunakan diantaranya"
count=1
for d in "$@"; do
	echo "$count $d"
	((count++))
done
echo "Jumlahnya ada $#"
echo
