#!/bin/sh
# copyright: Cyrille Pontvieux
# license: MIT
PRIMARY=$1
HDMI=$2
if [ -z "$PRIMARY" ]; then
  PRIMARY=$(xrandr --current|grep '[a-zA-Z0-9] connected'|grep -v 'HDMI'|cut -d' ' -f1|head -n1)
fi
if [ -z "$HDMI" ]; then
  HDMI=$(xrandr --current|grep '^HDMI'|cut -d' ' -f1|head -n1)
fi
xrandr-clone $PRIMARY $HDMI
