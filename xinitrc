#!/bin/sh

export GDK_SCALE=1
export GDK_DPI_SCALE=1.25
export QT_SCALE_FACTOR=1.25

systemctl --user import-environment DISPLAY XAUTHORITY

dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

xrandr --output DP-2 --mode 1920x1080 --rate 144

feh --bg-max ~/desktop2.png &


exec dbus-run-session -- i3
