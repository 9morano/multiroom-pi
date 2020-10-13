#!/bin/bash

# Script to run on the client devices, which would like to join multiroom setup
# Change IP address to your address!

# Kill old snapclient if it is still running (discard stderr and stdout)
kill $(pidof snapclient) &>/dev/null

IPADDR="0.0.0.0"

echo "Starting client - connecting to address ${IPADDR}"
snapclient -h ${IPADDR} > ~/snapclient-log.txt 2>&1 &