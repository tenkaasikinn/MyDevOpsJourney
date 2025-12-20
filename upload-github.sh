#!/bin/bash

set -euo pipefail

LOCATION="$1"
MSG="$2	"

cd "$LOCATION"
git rev-parse --is-inside-work-tree > /dev/null 2>&1 || {
	echo "That is not a git repository"
	exit 1
}

git status --short

git add .
git commit -m "$(date '+%Y-%m-%d') $MSG" || { 
	echo "Please write down the message"
	exit 0
}

git push
