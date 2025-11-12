#!/bin/bash
# user_report.sh - Simple system report

echo "============================="
echo "User Report - $(date)"
echo "============================="
echo

echo "Logged in Users:"
who
echo

echo "System uptime:"
uptime -p
echo

echo "Disk usage"
df -h --total | grep total
echo

echo "Memory usage"
free -h | awk '/Mem/{print "Used: " $3 " / " $2}'
echo