#!/bin/bash

picom &
xrandr -s 1920x1080 -r 75.00 &
copyq &
xsct 5600 0.92 &
# xmodmap ~/.Xmodmap &
# setxkbmap -option caps:super &
/usr/lib/polkit-gnome/polkit-gnome-autentication-agent-1 &
sh ~/.config/scripts/wall.sh &
