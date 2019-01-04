FROM java:8

ENV VERSION=2655277

RUN apt-get update && apt-get install -y wget unzip
RUN addgroup --gid 1234 minecraft
RUN adduser --disabled-password --home=/home/minecraft/enigmatica2 --uid 1234 --gid 1234 --gecos "minecraft user" minecraft

RUN mkdir /tmp/enigmatica2 && cd /tmp/enigmatica2 && \
	wget -c https://minecraft.curseforge.com/projects/enigmatica2expert/files/$VERSION/download -O Enigmatica2Server.zip && \
	unzip Enigmatica2Server.zip && \
	rm Enigmatica2Server.zip && \
	echo "eula=true" > eula.txt && \
	chown -R minecraft:minecraft /tmp/enigmatica2 && \
    chmod +x /tmp/enigmatica2/ServerStartLinux.sh

# RUN mkdir /enigmatica2
# RUN chown -R minecraft:minecraft /enigmatica2/

ADD entrypoint.sh /entrypoint.sh
RUN chown minecraft:minecraft /entrypoint.sh

WORKDIR /home/minecraft/enigmatica2
USER minecraft
EXPOSE 25565
VOLUME /home/minecraft/enigmatica2

ENTRYPOINT ["/entrypoint.sh"]
#ENTRYPOINT ["/enigmatica2/ServerStartLinux.sh"]
