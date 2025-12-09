#!/bin/bash

for t in /home/tenka/test-old/dummy2/*.txt; do
	echo "Membaca $t"
	cat $t
	echo "Itu Hasilnya"
done
