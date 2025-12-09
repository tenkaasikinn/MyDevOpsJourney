#!/bin/bash

read -p "Silahkan Masukan Nama Kamu: " name
if [[ "$name" == "tenka" ]]; then
	echo "Halo Tenka Selamat Datang"
else
	echo "Hayo kamu siapa nich? jangan ganggu ya"
	exit 1
fi
read -p "Sebelum lanjut tolong dong konfirmasi umur kamu: " age
if [[ "$age" -ge 18 ]]; then
	echo "Oh Kamu cukup umur silahkan masuk"
else
	echo "ih bocil jangan main Linux dulu ya"
	exit 1
fi
echo
echo "========== Informasi Sistem ========="
echo "Tanggal : $(date)"
echo "OS kamu : $(hostname)"
uptime -p
df -h
free -h
echo "Kita cek Koneksi dulu ya"
for host in google.com; do
	ping -c 1 -W 2 "$host" > /dev/null 2>&1 && \
		echo "Hore kamu terkoneksi" || \
		echo "Yah koneksi kamu terputus"
done
echo "Btw Kamu Pilih Wallpaper mana?"
for img in /home/tenka/Pictures/Anime-Wallpaper/*.png; do
	echo "$img"
	echo "hehe"
done
