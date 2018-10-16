Under construction

EX1: lsusb | grep -i wacom
OUTPUT: "Bus 003 Device 076: ID 056a:00cc Wacom Co., Ltd Cintiq 21UX (DTK-2100)"
EX2: "udevadm info -a -p $(udevadm info -q path -n /dev/bus/usb/$BUS/$DEVICE)"
OUTPUT: /devices/pci0000:00/0000:00:14.0/usb1/1-1
EX3: systemctl status /sys/devices/pci0000:00/0000:00:14.0/usb1/1-1
Now copy path like sys-devices-pci0000:00-0000:00:14.0-usb1-1\x2d1.device last WantedBy
