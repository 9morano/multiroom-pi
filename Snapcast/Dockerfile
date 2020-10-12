FROM arm32v7/debian:buster-slim

MAINTAINER grega@gmail.com

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN set -ex \
	&& apt-get update --fix-missing \
	&& apt-get install -y \
		build-essential\
		nano \
		gnupg \
		wget \
		python3-pip \
		gstreamer1.0-alsa \
		gstreamer1.0-libav \
		gstreamer1.0-plugins-good \
		gstreamer1.0-plugins-ugly \
		gstreamer1.0-tools \
		dialog \
		apt-utils

# Install snapserver and snapclient
RUN mkdir /root/Snapcast && cd /root/Snapcast \
        && wget https://github.com/badaix/snapcast/releases/download/v0.21.0/snapclient_0.21.0-1_armhf.deb \
        && wget https://github.com/badaix/snapcast/releases/download/v0.21.0/snapserver_0.21.0-1_armhf.deb \
        && apt install -y ./snapserver_0.21.0-1_armhf.deb \
        && apt install -y ./snapclient_0.21.0-1_armhf.deb
# I got errors saying that the service can not be started (invoke-rc.d: policy-rc.d denied execution of start.)

EXPOSE 6600 6800


#ENTRYPOINT ["mopidy"]

