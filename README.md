# Multiroom audio with RPi

Mopidy & snapcast using Docker containers

## Mopidy

### How to use

Build the docker image with
> docker build -t mopidy .

Run the docker container with (you must be in folder multiroom-pi/)

> docker run -it --name=mopidy \ \
  --device /dev/snd \ \
  -p 6800:6800 -p 6600:6600 \ \
  -v "$(pwd)/Mopidy/Music:/root/Mopidy/Music:ro" \ \
  -v "$(pwd)/Mopidy/local:/root/.local/share/mopidy" \ \
  -v "$(pwd)/Snapcast/snapfifo:/tmp/snapfifo" \ \
  mopidy

### Options

* --device /dev/snd flag is here to play music from container to system's audio output
* -v "Music" to share local library of music to container (read only)
* -v "local" to store local metadata such as libraries and playlists etc.
* -p "6680" exposes port for Iris HTTP server
* -p "6600" exposes MPD server

## Snapcast
