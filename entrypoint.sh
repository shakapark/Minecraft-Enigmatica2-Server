#!/bin/bash

if [[ ! -x /home/minecraft/enigmatica2/ServerStartLinux.sh ]]; then
  cp -r /tmp/enigmatica2/* .
fi

## Config via Environment Variables

## Launch Server
./ServerStartLinux.sh
