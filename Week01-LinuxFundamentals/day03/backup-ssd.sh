#!/bin/bash
# Test backup SSD

SRC="$HOME/Documents"
DEST="/run/media/tenka/Techbyte/FILE IRWAN/backup-scripts"
mkdir -p "$DEST"

DATE=$(date)
LOG="$DEST/backup.log"

rsync -avh --delete "$SRC/" "$DEST/" >> "$LOG" 2>&1

if [ $? -eq 0 ]; then
    echo "Backup Berhasil" >> "$LOG"
else 
    echo "Backup Gagal" >> "$LOG"
fi
