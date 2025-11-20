#!/bin/bash
# ==============================
# Day 5 Network Check - DevOps
# ==============================

TARGET_DIR="$HOME/MyDevOpsJourney/Day5"
LOG_FILE="$TARGET_DIR/network_report_$(date +%Y%m%d_%H%M%S).log"

mkdir -p "$TARGET_DIR"

echo "===== Network Check Report =====" > "$LOG_FILE"
echo "Date: $(date)" >> "$LOG_FILE"
echo >> "$LOG_FILE"

# 1️⃣ Ping test
echo ">>> Ping Test" >> "$LOG_FILE"
for host in 8.8.8.8 1.1.1.1 google.com; do
    echo "--> Pinging $host" >> "$LOG_FILE"
    ping -c 4 $host >> "$LOG_FILE" 2>&1
    echo >> "$LOG_FILE"
done

# 2️⃣ Interface & Route
echo ">>> IP Addresses & Routes" >> "$LOG_FILE"
ip a >> "$LOG_FILE"
echo >> "$LOG_FILE"
ip route >> "$LOG_FILE"
echo >> "$LOG_FILE"

# 3️⃣ NetworkManager info
echo ">>> NetworkManager DNS & Connection Info" >> "$LOG_FILE"
nmcli dev show | grep DNS >> "$LOG_FILE"
nmcli connection show >> "$LOG_FILE"
nmcli general status >> "$LOG_FILE"
echo >> "$LOG_FILE"

# 4️⃣ Socket & Port Info
echo ">>> Listening Ports (ss -tulnp)" >> "$LOG_FILE"
ss -tulnp >> "$LOG_FILE"
echo >> "$LOG_FILE"

echo ">>> Active Connections (ss -tuna)" >> "$LOG_FILE"
ss -tuna >> "$LOG_FILE"
echo >> "$LOG_FILE"

# 5️⃣ HTTP(S) Test
echo ">>> HTTP(S) Test with curl" >> "$LOG_FILE"
for url in https://google.com https://facebook.com; do
    echo "--> Testing $url" >> "$LOG_FILE"
    curl -w "Total: %{time_total}s\n" -o /dev/null -s $url >> "$LOG_FILE" 2>&1
    curl -v $url >> "$LOG_FILE" 2>&1
    echo >> "$LOG_FILE"
done