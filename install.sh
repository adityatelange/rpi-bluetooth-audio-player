#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
else
	echo "# installing Bluetooth Music Player"
	export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket
	export UDEV=1

	echo "installing packages.."
	apt-get install alsa-base alsa-utils bluealsa bluez bluez-firmware python-gobject python-dbus mpg123
	# bluez-firmware

	# Copy sounds
	echo "copying files"
	cp -r ./bluetooth-player/sounds/ /usr/src/sounds/

	# Setup udev rules - this lets us play the connect/disconnect sound
	# and also turn off discover/pairing when a client is connected
	cp -r ./bluetooth-player/bluetooth-udev /usr/src/
	chmod +x /usr/src/bluetooth-udev
	cp -r ./bluetooth-player/udev-rules/ /etc/udev/rules.d/

	# Bluetooth-agent handles the auth of devices
	cp -r ./bluetooth-player/bluetooth-agent /usr/src/
	chmod +x /usr/src/bluetooth-agent

	cp -r ./bluetooth-player/start.sh /usr/src/
	chmod +x /usr/src/start.sh

	echo "installing bluetooth-player service"
	sudo ln -sf /usr/src/start.sh /usr/local/bin/start_bt_player
	cp ./bluetooth-player/bluetooth-player.service /etc/systemd/system/

	echo "done !!!"
	echo "starting bt player"
	systemctl start bluetooth-player.service

fi
