#!/usr/bin/env bash

# Start Mopidy
mopidy &
status=$?

if [ $status -ne 0 ]; then
        echo "Failed to start mopidy..."
	exit
fi

# Start Snapserver

snapserver -d
status=$?

if [ $status -ne 0 ]; then
	echo "Failed to start Snapserver.."
	exit
fi

# Every 60 sec check if snapserver failed

while sleep 60; do
        ps aux |grep snapserver |grep -q -v grep
        status1=$?

        if [ $status1 -ne 0 ]; then
                echo "Snapserver failed"
                exit 1
        fi
done



