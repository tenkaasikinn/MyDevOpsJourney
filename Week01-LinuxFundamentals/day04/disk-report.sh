#!/usr/bin/env bash

LOGFILE="/tmp/disk_report_$(date +%Y%m%d_%H%M%S).log"

echo "=== Disk Health Report $(date) ===" | tee "$LOGFILE"

echo -e "\n[1] Disk Usage:" | tee -a "$LOGFILE"
df -h | tee -a "$LOGFILE"

ROOT_USE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
if [ "$ROOT_USE" -gt 80 ]; then
    echo "[WARNING] Root usage tinggi (${ROOT_USE}%)" | tee -a "$LOGFILE"
else
    echo "[OK] Root usage normal (${ROOT_USE}%)" | tee -a "$LOGFILE"
fi

echo -e "\n[2] Top 10 biggest directories in /var:" | tee -a "$LOGFILE"
sudo du -ah /var 2>/dev/null | sort -h | tail -n 10 | tee -a "$LOGFILE"

echo -e "\n[3] Top 10 biggest directories in HOME:" | tee -a "$LOGFILE"
du -ah $HOME 2>/dev/null | sort -h | tail -n 10 | tee -a "$LOGFILE"

echo -e "\nReport saved to: $LOGFILE"
