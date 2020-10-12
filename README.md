# Multiroom audio with RPi

Mopidy & snapcast using Docker containers

## How to use

Build the docker image with
> docker build -t mopidy .

Run the docker container with

> docker run -it --name=mopidy \
  --device /dev/snd \ 
  -p 6800:6800 -p 6600:6600 \
  -v "$(pwd)/Music:/root/Mopidy/Music" \
  -v "$(pwd)/local:/root/.local/share/mopidy" \
  mopidy

## Options

* --device /dev/snd flag is here to play music from container to system's audio output
* - v "Music" to share local library of music to container
* - v "local" to store local metadata such as libraries and playlists etc.
* - p "6680" exposes port for Iris HTTP server
* - p "6600" exposes MPD server
