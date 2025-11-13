#!/bin/bash
# Script otomatis update Fedora + Flatpak

LOG_DIR="/home/tenka/cron-log"
mkdir -p "$LOG_DIR" 
LOG_FILE="$LOG_DIR/auto-update.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

{
    echo "======== [$DATE] Mulai Update ========"
    sudo dnf -y upgrade --refresh
    flatpak update -y
    echo "======== [$DATE] Selesai Update ========"
    echo ""
} >> $LOG_FILE 2>&1
