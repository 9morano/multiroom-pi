#!/bin/bash

# Start the container with Mopidy and Snapserver running in it
# And run the snapclient to get the music from the server
#
# To exit run:
# $ docker kill multiroom-pi && docker rm multiroom-pi
# $ kill $(pidof snapclient)

echo "Starting Mopidy and Snapserver container (container name = multiroom_pi)"
docker run --name=multiroom-pi -d --net=host -v "$(pwd)/Music:/root/Mopidy/Music" -v "$(pwd)/data:/root/.local/mopidy" mopidy-snapcast

# Set the audio volume to the max (max = 400)
echo "Set RPi volume to 100%" 
amixer cset numid=1 -- 400

# Obtain IP address of the Raspberry-Pi
IPADDR=$(hostname -I)

echo "Starting client - connecting to address ${IPADDR:0:13}"
# Start the snapclient in background and store its output
snapclient -h ${IPADDR:0:13} > ~/multiroom-pi/data/snapclient-log.txt 2>&1 &
