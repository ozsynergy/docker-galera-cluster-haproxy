#!/bin/bash
# Starts up MariaDB within the container.

# Stop on error
set -e

# Start services
/usr/sbin/sshd

ipaddress=`ifconfig | grep inet | awk 'NR==1 {print $2}' | awk 'BEGIN { FS=":" } { print $2 }'`
echo "I am $ipaddress"
/bin/bash

