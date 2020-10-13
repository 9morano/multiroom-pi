#!/usr/bin/env bash

echo "Hello from container!"

# Start Mopidy
mopidy > /root/.local/mopidy/mopidy-log.txt 2>&1 &

status=$?

if [ $status -ne 0 ]; then
        echo "Failed to start mopidy..."
	exit
else
	echo "Mopidy started successfully!"
fi

# Start Snapserver

snapserver -d
status=$?

if [ $status -ne 0 ]; then
	echo "Failed to start Snapserver.."
	exit
else
	echo "Snapserver started successfully!"
fi

# Check every 60 sec if snapserver failed
while sleep 60; do
        ps aux |grep snapserver |grep -q -v grep
        status1=$?

        if [ $status1 -ne 0 ]; then
                echo "Snapserver failed"
                exit 1
        fi
done



