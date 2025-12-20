#!/bin/bash

set -euo pipefail

while getopts ":cmd" option; do
	case "$option" in
		c) 
			echo "Ini info CPU $(top -bn1 | awk '/Cpu/ {print $2}')%"
			;;
		m)
			echo "Ini opsi m"
			;;
		d) 
			echo "Ini opsi d"
			;;
	esac
done
