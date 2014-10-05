#!/bin/sh
cd $(dirname "$0")
mkdir -p $DESTDIR/etc/udev/rules.d $DESTDIR/etc/hdmi/connected.d $DESTDIR/etc/hdmi/disconnected.d $DESTDIR/etc/alsa $DESTDIR/etc/xrandr $DESTDIR/usr/bin $DESTDIR/usr/sbin
cp src/52-hdmi.rules $DESTDIR/etc/udev/rules.d/
cp src/asound-hdmi*.conf $DESTDIR/etc/alsa/
cp src/xrandr-hdmi-connected.sh src/xrandr-hdmi-disconnected.sh $DESTDIR/etc/xrandr/
cp src/xrandr.py src/xrandr-find-best-mode-for-clone src/xrandr-clone $DESTDIR/usr/bin/
cp src/hdmi-switch $DESTDIR/usr/sbin/
chmod +x $DESTDIR/etc/xrandr/*.sh \
         $DESTDIR/usr/bin/* \
         $DESTDIR/usr/sbin/*

