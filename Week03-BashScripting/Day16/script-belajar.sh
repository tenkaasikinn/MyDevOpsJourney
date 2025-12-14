#!/bin/bash

sapa () {
	echo "Halo! $1"
	echo "Kamu berumur $2 tahun"
}

test_jaringan () {
	target="$1"
	if ping -c 1 -W 1 "$target" >> /dev/null 2>&1; then
		echo "Koneksi ke $1 berhasil"
	else 
		echo "Koneksi $1  gagal"
	fi
}

test_jaringan google.com
test_jaringan 1.1.1.1
sapa tenka 23
