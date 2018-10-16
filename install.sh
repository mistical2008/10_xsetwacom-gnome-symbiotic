#!/usr/bin/env bash

USER_HOME=$(eval echo ~${SUDO_USER})
# Write user home path to *.service

# Copy files to destinations
mkdir $USER_HOME/.config/xsetwacom-gnome-symbiotic/
chown evgeniy.evgeniy $USER_HOME/.config/xsetwacom-gnome-symbiotic/
cp xsetwacom-gnome-symbiotic_setup.sh $USER_HOME/.config/xsetwacom-gnome-symbiotic/setup.sh
cp xsetwacom-gnome-symbiotic.rules /etc/udev/rules.d/
cp xsetwacom-gnome-symbiotic.service xsetwacom-gnome-symbiotic.service1
sed -i "s,1USER_HOME1,$USER_HOME,g" "xsetwacom-gnome-symbiotic.service1"
mv xsetwacom-gnome-symbiotic.service1 /etc/systemd/system/xsetwacom-gnome-symbiotic.service

# Run commands
chmod +x $USER_HOME/.config/xsetwacom-gnome-symbiotic/setup.sh
udevadm control --reload-rules
udevadm trigger
systemctl --user enable xsetwacom-gnome-symbiotic.service
systemctl --user start xsetwacom-gnome-symbiotic.service
