#!/bin/bash

test_ping () {
	target=$1

	for i in $target; do
		echo "test internet"
		ping -c 1 -W 1 "$target" > /dev/null 2>&1 && \
			echo "Test berhasil" || \
			echo "Test gagal" && exit 1
		done
}

test_ping google.com
