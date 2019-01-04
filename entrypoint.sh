#!/bin/bash

if [[ ! -x /home/minecraft/enigmatica2/ServerStartLinux.sh ]]; then
  cp -r /tmp/enigmatica2/* .
fi

## Config via Environment Variables
sed -i "/motd\s*=.*/ c motd=$MOTD" /home/minecraft/enigmatica2/server.properties
sed -i "/level-name\s*=.*/ c level-name=$MAP" /home/minecraft/enigmatica2/server.properties
sed -i "/difficulty\s*=.*/ c difficulty=$DIFFICULTY" /home/minecraft/enigmatica2/server.properties
sed -i "/gamemode\s*=.*/ c gamemode=$GAMEMODE" /home/minecraft/enigmatica2/server.properties
sed -i "/max-players\s*=.*/ c max-players=$MAXPLAYERS" /home/minecraft/enigmatica2/server.properties
sed -i "/pvp\s*=.*/ c pvp=$PVP" /home/minecraft/enigmatica2/server.properties
sed -i "/view-distance\s*=.*/ c view-distance=$VIEWDISTANCE" /home/minecraft/enigmatica2/server.properties
sed -i "/hardcore\s*=.*/ c hardcore=$HARDCORE" /home/minecraft/enigmatica2/server.properties

## Launch Server
./ServerStartLinux.sh
