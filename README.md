# Multiroom audio with RPi

Mopidy & snapcast using Docker containers
Both services are running in the same container

When container is started, run the snapclient service at the host to get the music

## How to use

Build the docker image with
> docker build -t mopidy-snapcast .

Run the docker container with

> docker run -it --name=mopidy \ \
  --device /dev/snd \ \
#  -p 6800:6800 -p 6600:6600 \ \
  --net=host \ \
  -v "$(pwd)/Music:/root/Mopidy/Music" \ \
  -v "$(pwd)/local:/root/.local/share/mopidy" \ \
  mopidy-snapcast

## Options

* --device /dev/snd flag is here to play music from container to system's audio output
* -v "Music" to share local library of music to container
* -v "local" to store local metadata such as libraries and playlists etc.
* -p "6680" exposes port for Iris HTTP server
* -p "6600" exposes MPD server

## TODO

Make script that starts both services (mopidy and snapserver) at start
