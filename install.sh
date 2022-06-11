#!/bin/bash

set -eu

if [[ `id -u` -ne 0 ]]; then
  echo "Please run as root"
  exit 1
fi

echo "Minecraft server installation"
echo ""
echo "This script install the followings."
echo ""
echo "openjdk-18-jre-headless (by apt)"
echo "screen (by apt)"
echo "/var/lib/minecraft"
echo "/var/lib/minecraft/scripts/start.sh"
echo "/var/lib/minecraft/scripts/stop.sh"
echo "/etc/systemd/system/minecraft@.service"
echo ""
printf "Do you continue?[Y/n]: "

read ANS

if [ "$ANS" != "" -a "$ANS" != "y" -a "$ANS" != "Y" ]; then
  echo "Abort."
  exit 0
fi

echo ""
echo "Installing minecraft service..."
mkdir -p /var/lib/minecraft/scripts
cp start.sh /var/lib/minecraft/scripts/
cp stop.sh /var/lib/minecraft/scripts/
cp minecraft@.service /etc/systemd/system/
systemctl daemon-reload
apt update && apt install screen openjdk-18-jre-headless

echo ""
echo "You can also install minecord."
echo "This will install the followings."
echo ""
echo "npm (by apt)"
echo "minecord (by npm)"
echo "/etc/systemd/system/minecord@.service"
echo ""
printf "Do you want to install minecord?[y/N]: "

read ANS

if [ "$ANS" == "y" -o "$ANS" == "Y" ]; then
  echo "Installing minecord..."
  apt update && apt install -y npm
  npm -g install minecord
  cp minecord@.service /etc/systemd/system/
  systemctl daemon-reload
fi

echo "Installation is finished successfully!"
echo "Please refer README.md and configure."