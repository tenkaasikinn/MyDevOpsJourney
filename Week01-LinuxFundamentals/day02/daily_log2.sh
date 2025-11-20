#!/bin/bash
# Log kedua

DIR="$HOME/reports"
mkdir -p "$DIR"

#Nama file log
TODAY=$(date +%F)
FILE="$DIR/filelog_${TODAY}.log"

#Kode
{
    echo "==========================="
    echo "Tanggal       :$(date)"
    echo "Hostname      :$(hostname)"
    echo "User          :$USER"
    echo "==========================="
    echo
} | tee -a "$FILE"

echo "Log ditambahkan ke $FILE"

#Hapus
find "$DIR" -type f -name "filelog_*.log" -mtime +7 -exec rm -f {} \;

echo "Log lama (> dari 7 hari) telah dihapus"
