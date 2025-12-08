#!/bin/bash

ls /home/$USER

if [[ $? -ne 0 ]]; then
	echo "Command gagal"
else 
	echo "Ini dia tuan"
fi
