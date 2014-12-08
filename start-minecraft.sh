#!/bin/sh

# link to persistent versions of data files
cd /minecraft-installer
for dir in players worlds plugins; do
  mkdir -p /minecraft/$dir
  ln -s /minecraft/$dir
done
for file in white-list.txt ops.txt pocketmine.yml banned-players.txt banned-ips.txt server.properties; do
  ln -s /minecraft/$file
done

./start.sh --no-wizard
