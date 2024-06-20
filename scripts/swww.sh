#!/bin/bash

# Get the current desktop session
current_session=$XDG_CURRENT_DESKTOP

# Define the function for setting wallpapers in Hyprland
set_wallpaper_hyprland() {
	dir="${HOME}/walls"
	BG="$(find "$dir" -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' -o -name '*.gif' | shuf -n1)"
	PROGRAM="swww-daemon"
	trans_type="simple"

	# Check if the program is running
	if pgrep "$PROGRAM" >/dev/null; then
		swww img "$BG" --transition-fps 244 --transition-type $trans_type --transition-duration 1
	else
		swww init && swww img "$BG" --transition-fps 244 --transition-type $trans_type --transition-duration 1
	fi
}

set_wallpaper_hyprland
