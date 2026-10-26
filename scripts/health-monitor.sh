#!/bin/bash

echo "Report Time: $(date '+%Y-%m-%d %H:%M:%S')"
echo "========================================"
echo "           SYSTEM HEALTH REPORT"
echo "========================================"

echo
echo "Hostname:"
hostname

echo
echo "System Uptime:"
uptime -p

echo
echo "Memory Usage:"
free -h

memory_used=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
echo "Memory Usage Percentage: ${memory_used}%"

if [ "$memory_used" -ge 80 ]; then
    echo "WARNING: High memory usage!"
else
    echo "Memory Status: NORMAL"
fi

echo
echo "Disk Usage:"
df -h /

disk_used=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')
echo "Disk Usage Percentage: ${disk_used}%"

if [ "$disk_used" -ge 80 ]; then
    echo "WARNING: High disk usage!"
else
    echo "Disk Status: NORMAL"
fi

echo
echo "CPU Information:"
echo "Available CPU cores: $(nproc)"

echo
echo "CPU Usage:"
cpu_idle=$(top -bn1 | grep "Cpu(s)" | sed 's/.*, *\([0-9.]*\) id.*/\1/')
cpu_usage=$(awk -v idle="$cpu_idle" 'BEGIN {printf "%.1f", 100-idle}')
echo "CPU Usage: ${cpu_usage}%"

echo
echo "========================================"
echo "        REPORT COMPLETED"
echo "========================================"
