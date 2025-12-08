#!/bin/bash

read -p "Masukan Nama Kamu: " name
read -p "Masukan Umur Kamu: " age

if [[ "$name" == "tenka" ]]; then
	echo "Selamat Datang Tenka"
else 
	echo "Kamu bukan Admin, Akses Ditolak!"
	exit 1
fi
echo "Sebentar sistem sedang verifikasi"
if [[ "$age" -ge 18 ]]; then
	echo "Oke Tenka Verifikasi Sukses"
else 
	echo "Kamu nyamar ya? xixixi, Akses Ditolak"
	exit 1
fi
echo
read -p "File apa yang ingin kamu cari Tenka? " file
if [[ -f "$file" ]]; then
	echo "Filenya ada silahkan baca menggunakan cat"
elif [[ -d "$file" ]]; then
	echo "Kayaknya itu directory"
else
	echo "Baik file maupun directory tidak ada"
	exit 1
fi
echo
echo "======= Status System ======="
echo
echo "Operating System	: $(hostname)"
echo
echo "Date		:$(date)"
echo
echo "Kondisi Wifi"
if nmcli general status | grep -q "full"; then
	echo "Terhubung ke Jaringan, Berikut Koneksinya"
else
	echo "Terlepas dari jaringan"
	exit 0
fi
ping -c 4 google.com
echo "Kondisi RAM & Storage"
free -h
echo
df -h
echo "Aktif Selama"
uptime -p
exit 0
