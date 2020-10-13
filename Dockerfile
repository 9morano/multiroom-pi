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
		avahi-utils \
		procps

# Add the Mopidy GPG key and APT repo to the package sources
# And install Mopidy
RUN set -ex \
	&& wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add - \
	&& wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list \
	&& apt update \ 
	&& DEBIAN_FRONTEND=noninteractive apt install -y \
	mopidy \
	mopidy-mpd

# Install extensions
RUN set -ex \
	&& python3 -m pip install\
	Mopidy-Iris \
	Mopidy-YouTube

# Install snapserver
RUN mkdir /root/Snapcast && cd /root/Snapcast \
	&& wget https://github.com/badaix/snapcast/releases/download/v0.21.0/snapserver_0.21.0-1_armhf.deb \
	&& apt install -y ./snapserver_0.21.0-1_armhf.deb

# Copy start script
WORKDIR /root
COPY start.sh start.sh

# Prepare config file for mopidy
RUN set -ex \
	&&  mkdir -p /root/.config/mopidy

# Copy config files into container
COPY mopidy.conf /root/.config/mopidy/mopidy.conf
COPY snapserver.conf /etc/snapserver.conf

# Allow any user tu run mopidy
RUN set -ex \
	&& usermod -G audio,sudo mopidy

EXPOSE 6600 6800 1704 1705

# Prepare volume for Music
VOLUME ["root/Mopidy/Music"]

ENTRYPOINT ["/root/start.sh"]

