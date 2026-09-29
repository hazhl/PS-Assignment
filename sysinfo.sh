#!/bin/bash

echo "System Information"

cat <<  EOF
Executed by: $(whoami)
Host Name: $(hostname)
Server IP: $(hostname -I | awk '{print $1}')
Public IP: $(curl -s ifconfig.me)
OS Type and Version: $(lsb_release -d | cut -f2)
Kernel Version: $(uname -r)
Architecture: $(uname -m)
Virtualization: $(systemd-detect-virt)
Server Time: $(date)
TimeZone: $(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5}')
Uptime: $(uptime -p)

Resource Usage

Total Memory: $(free -h | awk '/^Mem:/ {print $2}')
Memory Usage: $(free -h | awk '/^Mem:/ {print $3 " / " $2}')
Swap Usage: $(free -h |awk '/^Swap:/ {print $3 " / " $2}')
CPU Cores: $(nproc)
EOF
