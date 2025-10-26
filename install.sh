#!/bin/bash

DIR="$(dirname $(readlink -f "$0"))"
SEDDIR=$(sed 's|/|\\/|g' <<< $DIR)

sed -e "s/\/path\/to\/my-udev-notify/$SEDDIR/" < $DIR/stuff/my-udev-notify.rules | sudo tee /etc/udev/rules.d/90-my-udev-notify.rules > /dev/null

sudo udevadm control --reload-rules
