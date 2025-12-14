#!/bin/bash

test_ping() {
	target=$1
	echo "Ping ke $target"

	for i in {1..3}; do
		echo "tes jaringan ke $i"
		ping -c -1 -W 1 "$target" > /dev/null 2>&1
		echo "berhasil di $i"
	done
}

test_ping google.com
