FROM debian:jessie
MAINTAINER Zach Latta <zach@zachlatta.com>

RUN apt-get update \
  && apt-get install -y perl gcc g++ make automake libtool autoconf m4 gcc-multilib wget \
  && apt-get clean

RUN useradd -s /bin/bash -d /minecraft -m minecraft -u 1000 \
  && mkdir /minecraft-installer \
  && chown minecraft:minecraft /minecraft-installer

USER minecraft
WORKDIR /minecraft
VOLUME /minecraft
EXPOSE 19132/udp

ENV VERSION Alpha_1.4dev-855

RUN cd /minecraft-installer \
  && wget -q -O - http://get.pocketmine.net/ | bash -s - -v beta

COPY start-minecraft.sh /
CMD /start-minecraft.sh
