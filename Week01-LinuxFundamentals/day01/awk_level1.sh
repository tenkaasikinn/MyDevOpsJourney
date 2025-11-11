#!usr/bin/env bash
echo "=== Print kolom pertama ==="
awk '{print $1}' /etc/passwd

echo "=== Separator : dan print kolom 1 dan 3 ==="
awk -F: '{print $1, $2}' /etc/passwd

echo "=== File custom ==="
echo "Tenka:DevOps:Fedora" > test.txt
awk -F':' '{print $1, $3}' test.txt
