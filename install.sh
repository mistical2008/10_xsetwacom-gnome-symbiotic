#!/usr/bin/env bash

USER_HOME=$(eval echo ~${SUDO_USER})

# Copy files to destinations
mkdir $USER_HOME/.config/xsetwacom-gnome-symbiotic/
chown evgeniy.evgeniy $USER_HOME/.config/xsetwacom-gnome-symbiotic/
cp xsetwacom-gnome-symbiotic_setup.sh $USER_HOME/.config/xsetwacom-gnome-symbiotic/setup.sh
cp xsetwacom-gnome-symbiotic.rules /etc/udev/rules.d/
cp xsetwacom-gnome-symbiotic.service /etc/systemd/system/

# Run commands
chmod +x $USER_HOME/.config/xsetwacom-gnome-symbiotic/setup.sh
udevadm control --reload-rules
udevadm trigger
systemctl --user enable xsetwacom-gnome-symbiotic.service
systemctl --user start xsetwacom-gnome-symbiotic.service
