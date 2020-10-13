#!/bin/bash

echo "Starting container"
# Start the mopidy and snapcast container
docker run --name=multiroom-pi -d --net=host -v "$(pwd)/Music:/root/Mopidy/Music" -v "$(pwd)/data:/root/.local/mopidy" mopidy-snapcast

# Sleep for few seconds so container can run
#sleep 5

# Obtain IP address of the Raspberry-Pi
IPADDR=$(hostname -I)

echo "Starting client - connecting to address ${IPADDR:0:13}"
# Start the snapclient in background and store its output
snapclient -h ${IPADDR:0:13} > ~/multiroom-pi/data/snapclient-log.txt 2>&1 &
