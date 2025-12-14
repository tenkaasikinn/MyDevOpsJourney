#!/bin/bash

while IFS=',' read -r sa sb sc; do
	echo "$sa lalu $sc lalu $sb"
done < data.csv
