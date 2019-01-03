FROM java:8

ENV VERSION=3.0.15

RUN apt-get update && apt-get install -y wget unzip
RUN addgroup --gid 1234 minecraft
RUN adduser --disabled-password --home=/data --uid 1234 --gid 1234 --gecos "minecraft user" minecraft

RUN mkdir /tmp/enigmatica2 && cd /tmp/enigmatica2 && \
	wget -c https://minecraft.curseforge.com/projects/enigmatica2expert/files/2653969/download -O Enigmatica2Server.zip && \
	unzip Enigmatica2Server.zip && \
	rm Enigmatica2Server.zip && \
	chown -R minecraft:minecraft /tmp/enigmatica2 && \
        chmod +x /tmp/enigmatica2/ServerStartLinux.sh

USER minecraft

EXPOSE 25565

# VOLUME /data
WORKDIR /tmp/enigmatica2

RUN echo "eula=true" > eula.txt

ENTRYPOINT ["/tmp/enigmatica2/ServerStartLinux.sh"]
