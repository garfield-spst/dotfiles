#!/usr/bin/env bash
nm-applet
sleep 4
killall -e xdg-desktop-portal-hyprland
killall xdg-desktop-portal-gtk
killall nm-applet
/usr/lib/xdg-desktop-portal-hyprland &
sleep 4
/usr/lib/xdg-desktop-portal-gtk &
sleep 10
nm-applet
