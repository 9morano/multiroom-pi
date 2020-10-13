# Multiroom audio with RPi

Mopidy & snapcast using Docker containers
Both services are running in the same container

**NOTE** Make the folders Music/ (with music) and data/ (for storing playlists etc.)

When container is started, run the snapclient service on the host device to get the music
> snapclient -h [IP-of-the-Pi]

## How to use

Build the docker image with
> docker build -t mopidy-snapcast .

Run the docker container with


docker run --name=multiroom-audio -d --net=host -v "$(pwd)/Music:/root/Mopidy/Music" -v "$(pwd)/data:/root/.local/mopidy" mopidy-snapcast


> docker run -it --name=mopidy \ \
  --device /dev/snd \ \
#  -p 6800:6800 -p 6600:6600 \ \
  --net=host \ \
  -v "$(pwd)/Music:/root/Mopidy/Music" \ \
  -v "$(pwd)/data:/root/.local/share/mopidy" \ \
  mopidy-snapcast

## Options

* --device /dev/snd flag is here to play music from container to system's audio output
* -v "Music" to share local library of music to container
* -v "local" to store local metadata such as log files, libraries and playlists etc.
* -p "6680" exposes port for Iris HTTP server
* -p "6600" exposes MPD server



