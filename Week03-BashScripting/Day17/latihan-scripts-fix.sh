#!/bin/bash

set -euo pipefail

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

usage () {
	echo "Penggunaan: $0 [-c] [-m] [-d] [-e] [-a]"
	echo 
	echo "Opsi"
	echo " -c : Info CPU"
	echo " -m : Info RAM"
	echo " -d : Info Disk"
	echo " -e : Info Error"
	echo " -a : Info Semuanya"
	exit 1
}

jaringan () {
        local ip
	echo -e "${YELLOW}======== Selamat Datang $USER =========${RESET}"
	echo
        echo -e "${YELLOW}======== Kita Tes Jaringan dulu =========${RESET}"
        echo
        for ip in google.com 1.1.1.1 8.8.8.8; do
                echo -e "Menghubungkan ke ${YELLOW} $ip ${RESET}"
                ping -c 1 -W 1 "$ip" > /dev/null 2>&1 && \
                        echo -e "${GREEN} Koneksi berhasil $ip ${RESET}" || \
                        echo -e "${RED} Koneksi gagal ke $ip ${RESET} "
        done
	echo
}

data_basic () {
	ip_addr=$(hostname -I 2>/dev/null | awk '{print $1}' || echo "N/A")
        echo -e "${YELLOW}======== Ini informasi sementara ========${RESET}"
        echo
        echo "date      : $(date '+%Y-%m-%d %H:%M:%S')"
        echo "OS        : $(hostname)"
	echo "Kernel	  : $(uname -r)"
	echo "IP	  : $ip_addr"
	echo
}


info_ssd () {
        disk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
        total_ssd=$(df / -h | awk 'NR==2 {print $2}' | tr -d 'G')
        if [ "$disk_usage" -ge 85 ]; then
                echo -e "${RED}[BAHAYA] Penggunaan SSD sekarang ${disk_usage}% dari ${total_ssd} GB${RESET}"
        elif [ "$disk_usage" -ge 70 ]; then
                echo -e "${YELLOW}[PERINGATAN] Penggunaan SSD sekarang ${disk_usage}% dari ${total_ssd} GB${RESET}"
        else
                echo -e "${GREEN}[AMAN] Penggunaan SSD sekarang ${disk_usage}% dari ${total_ssd} GB${RESET}"
        fi
}

info_ram () {
        total_ram=$(free -m | awk '/Mem:/ {print $2}')
        avail_ram=$(free -m | awk '/Mem:/ {print $7}')
        usage_ram=$(( (total_ram - avail_ram) * 100 / total_ram ))
        if [ "$usage_ram" -ge 85 ]; then
                echo -e "${RED}[BAHAYA] Penggunaan RAM sekarang mencapai ${usage_ram}%${RESET}"
        elif [ "$usage_ram" -ge 70 ]; then
                echo -e "${YELLOW}[PERINGATAN] Penggunaan RAM sekarang mencapai ${usage_ram}%${RESET}"
        else
                echo -e "${GREEN}[AMAN] Penggunaan RAM sekarang mencapai ${usage_ram}%${RESET}"
        fi
}

info_cpu () {
        cpu_usage=$(top -bn1 | awk '/Cpu/ {print 100 - $8}')
        echo -e "${YELLOW}[INFO] Berikut penggunaan CPU: ${cpu_usage}%${RESET}"
}

info_error () {
	error_count=$(journalctl -p err --since "1 hour ago" | wc -l)
	if [ "$error_count" -gt 0 ]; then
		echo -e "${RED}[PERINGATAN] Terdapat error sebanyak ${error_count} sejak 1 jam yang lalu${RESET}"
	else
		echo -e "${GREEN}[AMAN] Tidak terdapat error${RESET}"
	fi 
}
[[ $# -eq 0 ]] && usage
jaringan
data_basic
while getopts ":cmdea" option; do
        case "$option" in
                c)
                        echo -e "${YELLOW}======= Ini info penggunaan CPU kamu =========${RESET}"
			echo
                        info_cpu
                        ;;
                m)
                        echo -e "${YELLOW}======== Ini info penggunaan RAM kamu ========${RESET}"
			echo
                        info_ram
                        ;;
                d)
                        echo -e "${YELLOW}========= Ini info penggunaan Disk kamu =========${RESET}"
			echo
                        info_ssd
                        ;;
		e) 
			echo -e "${YELLOW}========= Ini info error yang ada sejak satu jam yang lalu =======${RESET}"
			echo
			info_error
			;;
		a)
			echo -e "${YELLOW}========= Ini semua info buat Disk, RAM, CPU, jumlah error ========${RESET}"
			echo
			info_ssd
			info_ram
			info_cpu
			info_error
			;;
		\?)
			echo -e "${RED}============ SILAHKAN MASUKAN PERINTAH YANG VALID =========== ${RESET}"
			usage
			;;
        esac
done
exit 0
