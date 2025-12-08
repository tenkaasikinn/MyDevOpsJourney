#!/bin/bash

if [[ -n "$1" ]]; then
	name=$1
else 
	read -p "Masukin Nama dulu: " name
fi

if [[ "$name" == "tenka" ]]; then
	echo "Selamat Datang"
else
	echo "Akses ditolak"
	exit 1
fi 

echo "==== Berikut Laporan Sistem ====="
echo
echo "OS : $(hostname)"
echo
echo "Tanggal : $(date)"
echo
uptime -p
echo
df -h
echo
free -h
echo
echo "==== Have a Nice Day ===="
