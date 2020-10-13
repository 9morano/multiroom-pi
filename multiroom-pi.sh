#!/bin/bash


# Start the mopidy and snapcast container
docker run --name=multiroom-pi -d --net=host -v "$(pwd)/Music:/root/Mopidy/Music" -v "$(pwd)/data:/root/.local/mopidy" mopidy-snapcast

# Sleep for few seconds so container can run
#sleep(5)

# Start the snapclient in background and store its output
snapclient -h 192.168.2.180 > ~/multiroom-pi/data/snapclient-log.txt 2>&1 &
