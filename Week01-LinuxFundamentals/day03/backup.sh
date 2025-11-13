#!/bin/bash
# Backup sh 

SRC="$HOME/Documents"
DEST="$HOME/backup_test"
mkdir -p "$DEST"
LOG="$HOME/backup_test/backup.log"

DATE=$(date '+%Y-%m-%d %H-%M-%S')

echo "[$DATE] Backup dimulai...." | tee -a "$LOG"

rsync -avh --delete "$SRC/" "$DEST/" | tee -a "$LOG"

if [ ${PIPESTATUS[0]} -eq 0 ]; then
    echo "[$DATE] Backup selesai sukses!" | tee -a "$LOG"
else 
    echo "[$DATE] Backup gagal!" | tee -a "$LOG"
fi

