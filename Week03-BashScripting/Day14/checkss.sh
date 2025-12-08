#!/bin/bash

if ss -tulnp | grep -q ":22"; then
	echo "SSH nyala"
else
	echo "SSH mati"
fi
