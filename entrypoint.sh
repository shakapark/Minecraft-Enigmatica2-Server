#!/bin/bash

if [[ ! -x /enigmatica2/ServerStartLinux.sh ]]; then
  cp /tmp/enigmatica2/* /enigmatica2
fi

## Config via Environment Variables

## Launch Server
./ServerStartLinux.sh
