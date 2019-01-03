FROM java:8

ENV VERSION=3.0.15

RUN apt-get update && apt-get install -y wget unzip
RUN addgroup --gid 1234 minecraft
RUN adduser --disabled-password --home=/data --uid 1234 --gid 1234 --gecos "minecraft user" minecraft

RUN mkdir /tmp/enigmatica2 && cd /tmp/enigmatica2 && \
	wget -c https://minecraft.curseforge.com/projects/enigmatica2expert/files/2653969/download -O Enigmatica2Server.zip && \
	unzip Enigmatica2Server.zip && \
	rm Enigmatica2Server.zip && \
	chown -R minecraft:minecraft /tmp/enigmatica2

USER minecraft

EXPOSE 25565

ADD start.sh /start

VOLUME /data
ADD server.properties /tmp/server.properties
WORKDIR /data

ENTRYPOINT ["/tmp/enigmatica2/ServerStartLinux.sh"]
