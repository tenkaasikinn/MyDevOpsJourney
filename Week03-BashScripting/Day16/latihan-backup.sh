#!/bin/bash

backup () {
	local sumber=$1
	local tujuan=$2

	echo "Memulai Backup dari $sumber ke $tujuan"
	rsync -avh --delete "$sumber" "$tujuan" > /dev/null 2>&1 
	
	if [[ $? == 0 ]]; then
		echo "Backup Berhasil"
	else
		echo "Backu Gagal"
	fi
}	

backup $1 $2
