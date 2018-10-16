#!/usr/bin/env bash

# Copy files to destinations
cp xsetwacom-gnome-symbiotic_setup.sh /usr/bin/
cp xsetwacom-gnome-symbiotic.rules /etc/udev/rules.d/
cp xsetwacom-gnome-symbiotic.service /etc/systemd/system/

# Run commands
chmod +x /usr/bin/xsetwacom-gnome-symbiotic_setup.sh
udevadm control --reload-rules
udevadm trigger
systemctl --user enable xsetwacom-gnome-symbiotic.service
systemctl --user start xsetwacom-gnome-symbiotic.service
