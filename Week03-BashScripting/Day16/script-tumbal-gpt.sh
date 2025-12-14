#!/bin/bash

tulis() {
	echo "Nama gua: $1"
}

jaringan() {
	target="$1"
	if ping -c 1 -W 1 "$target" > /dev/null 2>&1; then
		echo "Koneksi Terhubung dengan $target"
	else 
		echo "Koneksi dengan $target gagal"
	fi
}

waktu() {
	echo "tunjukan $("$@")"
}
tulis tenka
jaringan google.com 
waktu uptime -p
