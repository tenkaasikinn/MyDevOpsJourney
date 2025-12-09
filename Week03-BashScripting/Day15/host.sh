#!/bin/bash

for host in google.com; do
	echo "Lagi cek koneksi ya :D"
	ping -c 1 "$host" > /dev/null 2>&1 && \
		echo "Hore Kamu Terhubung ke Internet" || \
		echo "Yah Koneksi kamu putus"
	echo "======"
done
