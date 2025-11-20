#!/bin/bash
# Daily Log

DIR="$HOME/reports"
mkdir -p "$DIR"

TODAY=$(date +%F)
FILE="$DIR/report_${TODAY}.log"

{
    echo "============================="
    echo "Tanggal       :$(date)"
    echo "Hostname      :$(hostname)"
    echo "User          :$USER"
    echo "============================="
    echo
} | tee -a "$FILE"

echo
echo "Log telah ditambahkan ke $FILE"
