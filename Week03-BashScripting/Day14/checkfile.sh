#!/bin/bash

FILE=$1

if [[ -z $FILE ]]; then
	echo "Namanya mana tod?"
	exit 1
fi

if [[ -f $FILE ]]; then
	echo "Nah filenya ada"
elif [[ -d $FILE ]]; then
	echo "Ini directory tod"
elif [[ -e $FILE ]]; then
	echo "Ada sih tapi gak tahu ini yang lu cari apa bukan"
else
	echo "Gak ada filenya"
fi
