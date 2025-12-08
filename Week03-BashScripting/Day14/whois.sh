#!/bin/bash

if [[ -n $1 ]]; then
	name=$1
else
	read -p "Masukin nama dulu: " name
fi

if [[ "$name" == "tenka" ]]; then
	echo "Welcome back tenka"
else 
	echo "Lu siapa njir"
fi
