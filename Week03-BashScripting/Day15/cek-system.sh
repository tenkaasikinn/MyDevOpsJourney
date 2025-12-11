#!/bin/bash

#Color
GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

read -p "Kamu siapa? " name

if [[ "$name" != "$USER" ]]; then
	printf "${RED}Kamu siapa?${RESET}"
	exit 1
fi
printf "${GREEN}============ Ini informasi sistem sekarang ya $USER ===========${RESET}"
echo 
echo "Tanggal		: $(date)"
echo "OS     		: $(hostname)"
echo "Kernel 		: $(uname -r)"
echo "Waktu nyala 	: $(uptime -p)"
echo "Ini ip kamu	: $(hostname -i | awk '{print $2}')"
echo
echo "========= Tes Koneksi Internet =============="
for ip in google.com 1.1.1.1 8.8.8.8; do
	echo "Sedang Melakukan cek koneksi kamu dengan $ip"	
	ping -c 1 -W 1 "$ip" > /dev/null 2>&1 &&\
	       	printf "${GREEN}Koneksi kamu terhubung${RESET}\n" || \
	       	printf "${RED}Koneksi kamu terputus${RESET}\n"
done
echo
echo "============= Ini informasi RAM dan Storage kamu =========="
free -h
echo
df -h
