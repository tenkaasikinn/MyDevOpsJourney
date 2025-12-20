#!/bin/bash

echo "Sedang cek kondisi wifi"
echo
if nmcli general status | grep -q "full"; then
	echo "Wifi Nyala"
else 
	echo "Wifi Mati, Silahkan melakukan koneksi ulang"
	exit 1
fi
echo
echo "Berikut koneksi nya"
ping -c 4 google.com

