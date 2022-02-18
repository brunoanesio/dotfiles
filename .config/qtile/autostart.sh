#!/bin/bash
xrandr --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal &
nitrogen --restore &
nm-applet &
setxkbmap -layout br &
numlockx &
picom --experimental-backends -b &
thunar --daemon &
corectrl &
