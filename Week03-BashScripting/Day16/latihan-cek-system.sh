#!/bin/bash

# --- kebutuhan text ----

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

# --- cek user ----

cek_user () {
	local masuk_nama
	read -p "Halo kamu siapa? " masuk_nama

	if [[ "$masuk_nama" != "$USER" ]]; then
		printf "${RED} Kamu siapa? hayo jangan jalanin script ini ${RESET}"
		exit 1
	fi
	echo
}

# ----- cek internet ------

cek_jaringan () {
	local ip
	echo "============== Cek jaringan ==============="
	echo
	for ip in google.com 1.1.1.1 8.8.8.8; do
		printf "Sedang menghubungkan dengan $ip\n" 
		ping -c 1 -W 1 "$ip" > /dev/null 2>&1 && \
			printf "${GREEN} Terkoneksi dengan $ip ${RESET}\n" || \
			printf "${RED} Gagal terkoneksi dengan $ip ${RESET}\n"
	done
	echo
}

# -------- cek sistem ---------

informasi_basic () {
	local ip
	ip=$(hostname -i | awk '{print $2}')

	echo "============== Ini file keterangan sistem kamu hari ini =============="
	echo
	echo "Tanggal 	: $(date '+%Y-%m-%d %H:%M:%S')"
	echo "OS		: $(hostname)"
	echo "kernel		: $(uname -r)"
	echo "Waktu nyala	: $(uptime -p)"
	echo "ini ip kamu	: $ip"
	echo
}

# ---------- cek ram storage dan cpu ----------

info_storage () {
	disk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
	echo "============ Info Penggunaan Storage, RAM dan CPU ==============="
	echo
	if [ "$disk_usage" -ge 85 ]; then
		echo -e "${RED}[BAHAYA] Penggunaan SSD sudah mencapai: ${disk_usage}%${RESET}"
	elif [ "$disk_usage" -ge 70 ]; then
		echo -e "${YELLOW}[PERINGATAN] Penggunaan SSD sudah mencapai: ${disk_usage}%${RESET}"
	else 
		echo -e "${GREEN}[AMAN] Penggunaan SSD sudah mencapai: ${disk_usage}%${RESET}"
	fi
}

info_ram () {
	ram_total=$(free -m | awk '/Mem:/ {print $2}')
	ram_avail=$(free -m | awk '/Mem:/ {print $7}')
	ram_usage=$(( (ram_total - ram_avail) * 100 / ram_total))
	if [ "$ram_usage" -ge 85 ]; then
		echo -e "${RED}[BAHAYA] Penggunaan RAM saat ini mencapai: ${ram_usage}%${RESET}"
	elif [ "$ram_usage" -ge 70 ]; then
		echo -e "${YELLOW}[PERINGATAN] Penggunaan RAM saat ini mencapai: ${ram_usage}%${RESET}"
	else 
		echo -e "${GREEN}[AMAN] Penggunaan RAM saat ini mencapai: ${ram_usage}%${RESET}"
	fi
}

info_cpu () {
	cpu_idle=$(top -bn1 | awk '/Cpu/ {print $8}')
	cpu_usage=$(echo "100 - $cpu_idle" | bc)
	echo -e "${YELLOW}[INFO] Informasi penggunaan CPU saat ini: ${cpu_usage}%${RESET}"
}

cek_user
cek_jaringan
informasi_basic
info_storage
info_ram
info_cpu
exit 0
