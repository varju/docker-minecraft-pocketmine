#!/bin/sh

cd /minecraft

# sync the installed files over to persistent storage
if [ ! -f PocketMine-MP.phar ]; then
  cp -rp /minecraft-installer/* .
fi

./start.sh --no-wizard
