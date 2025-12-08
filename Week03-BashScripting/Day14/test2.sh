#!/bin/bash

if [[ -n "$1" ]]; then
	name=$1
else 
	read -p "Masukkan Nama Kamu: " name
fi

if [[ "$name" == "tenka" ]]; then
	echo "Selamat Datang Tenka"
else
	echo "Kamu bukan Admin!, Akses Ditolak!"
	exit 1
fi

echo "===== Berikut Data saat ini ======="
echo
echo "Operating System	: $(hostname)"
echo
echo "Date		: $(date)"
echo
echo "Kondisi RAM: "
free -h
echo
echo "Kondis Storage: "
df -h 
echo
echo "Melakukan cek kondisi internet"
if nmcli general status | grep -q "full"; then
	echo "Wifi Tersambung"
else 
	echo "Wifi Putus"
	exit 1
fi
echo "Berikut koneksi jaringan kamu"
ping -c 4 google.com
echo
read -p "Apa yang kamu cari hari ini? " file
if [[ -f "$file" ]]; then
	echo "File ada silahkan melakukan cat untuk melihat isinya"
	exit 1
elif [[ -d "$file" ]]; then
	echo "Itu directory silahkan ingat lagi"
	exit 1
else
	echo "File gak ada"
	exit 1
fi
