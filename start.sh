#!/usr/bin/env bash

echo "Hello from container!"

snapserver -d

status=$?

if [ $status -ne 0 ]; then
        echo "Failed to start snapserver..."
	exit
else
	echo "Snapserver started successfully!"
fi

echo "Starting Mopidy!"

mopidy
