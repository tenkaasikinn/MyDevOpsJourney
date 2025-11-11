#!usr/bin/env bash

echo "=== Filter berdasarkan text ==="
awk -F: '/bash/ {print $1}' /etc/passwd

echo "=== Fiter pakai kondisi kolom ==="
awk -F: '$3 < 1000 {print $1, $3}' /etc/passwd

echo "=== Tambah header/footer (BEGIN & END) ==="
awk -F: 'BEGIN {print "=== User List ==="} {print $1} END {print "=== Done ==="}' /etc/passwd

echo "=== pakai if ==="
awk -F: '{ if ($3 >= 1000) print $1, "=> regular user"; else print $1, "=> system user" }' /etc/passwd

