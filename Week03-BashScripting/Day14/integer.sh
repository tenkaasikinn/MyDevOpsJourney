#!/bin/bash

read -p "Masukkan umurmu: " age

if [[ "$age" -lt 18 ]]; then
	echo "Bocil Jangan Main disini"
else 
	echo "Boleh Main"
fi
