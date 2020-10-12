FROM debian:latest

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
#		python3-pip \
#		gstreamer1.0-alsa \
#		gstreamer1.0-libav \
#		gstreamer1.0-plugins-good \
#		gstreamer1.0-plugins-ugly \
#		gstreamer1.0-tools \
		dialog \
		apt-utils \
		libasound2-dev \
		libvorbisidec-dev \
		libvorbis-dev \
		libflac-dev \
		alsa-utils \
		libavahi-client-dev \
		avahi-daemon
		
# Install snapserver and snapclient
RUN mkdir /root/Snapcast && cd /root/Snapcast \
        && wget https://github.com/badaix/snapcast/releases/download/v0.21.0/snapclient_0.21.0-1_armhf.deb \
        && wget https://github.com/badaix/snapcast/releases/download/v0.21.0/snapserver_0.21.0-1_armhf.deb \
        && apt install -y ./snapserver_0.21.0-1_armhf.deb \
        && apt install -y ./snapclient_0.21.0-1_armhf.deb
# I got errors saying that the service can not be started (invoke-rc.d: policy-rc.d denied execution of start.)

COPY snapserver.conf /etc/snapserver.conf

EXPOSE 1704 1705


#ENTRYPOINT ["snapserver"]

