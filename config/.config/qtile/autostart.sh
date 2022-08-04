#!/bin/bash
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# xrandr --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal &
nitrogen --restore &
setxkbmap -layout br &
numlockx &
nm-applet &
picom --experimental-backends -b &
/usr/bin/emacs --daemon &
corectrl &
keepassxc &
