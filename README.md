# Multiroom audio with RPi

Mopidy & snapcast using Docker containers. Both services are running in the same container.

**NOTE** Make the folders Music/ (with your music) and data/ (for storing log files, libraries, playlists etc.)

# How to use

## First usage

1. Download the repo.

2. Instal Docker on RPi.

3. Build the docker image with
> docker build -t mopidy-snapcast .

4. Download the snapclient and install it with
> wget https://github.com/badaix/snapcast/releases/download/v0.21.0/snapserver_0.21.0-1_armhf.deb \
	&& apt install -y ./snapserver_0.21.0-1_armhf.deb

5. Disable snapclient to run at power-up (since we will start it manually)
> sudo systemctl disable snapclient

6. Make a folder for local music named Music located in this repo (multiroom-pi/) (volume is mounted to the container) \
Make a folder for data where the log-files, libraries, playlists, etc. will be stored (volume mounted to the container)

7. Run *multiroom-pi.sh* script to start the Mopidy container and snapclient
> ./multiroom-pi.sh

8. Optionally add it to crontab or other service to start it on the boot of the RPi

## Testing

Run docker container with
> docker run --name=multiroom-audio -it --net=host --entrypoint=/bin/bash -v "$(pwd)/Music:/root/Mopidy/Music" -v "$(pwd)/data:/root/.local/mopidy" mopidy-snapcast

Run the snapclient with
> snapclient -h [IP_address-of-the-RPi]

### Docker flags

* -it : to run it in interactive mode
* --net=host : to share the net with host (exposing ports would do the same)
* --entrypoint=/bin/bash : to disable default entry point and go to bash
* -v"$(pwd)/Music : to share Music folder with container
* -v"$(pwd)/data : to share data folder with container

Some additional options:

* --device /dev/snd : connect audio driver to play the music from the container (needed if Mopidy plays music directly, without snapcast)
* -p 6680:6680 : you can expose only necessary ports instead whole network (6680, 6600, 1704, 1705)

### Configuration

Configuration of the Mopidy and Snapserver are stored in the mopidy.conf and snapserver.conf correspondingly.
You can change the output of the Mopidy directly to the audio output in mopidy.conf with line:
> [audio] \
> output = autoaudiosink