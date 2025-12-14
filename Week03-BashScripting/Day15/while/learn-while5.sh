#!/bin/bash

count=1
while ! curl -s https://example.com > /dev/null 2>&1; do
	echo "Percobaan $count"
	((count ++))
	[[ "$count" -gt 5 ]] && echo "Gagal Total" && exit 1
	sleep 1
done
echo "Berhasil"
