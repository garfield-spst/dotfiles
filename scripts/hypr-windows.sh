#!/bin/bash

 hyprctl dispatch focuswindow address:"$(hyprctl -j clients | jq 'map(" \(.workspace.id)  ┇  \(.class)              ┇ \(.address)")' | sed "s/,$//; s/^\[//; s/^\]//; s/^[[:blank:]]*//; s/^\"//; s/\"$//" | grep -v "^$" | fuzzel --dmenu -p "Select window: " --font=JetBrainsMono:weight=Bold:size=25 --width=25 | grep -o "0x.*$")"

# Fetch the list of open windows
# active_window=$(hyprctl -j activewindow)
# windows=$(hyprctl clients -j | jq -r '.[] | "\(.address) \(.class)"')
#
# # Display the list in fuzzel and get the selected window address
# selected=$(echo "$windows" | fuzzel --dmenu -p "Select window: " --font=JetBrainsMono:weight=Bold:size=25 | awk '{print $1}')
#
# echo "$selected"
# If a window is selected, switch to it
# if [ -n "$selected" ]; then
#     hyprctl dispatch focuswindow "$selected"
# else
#     echo "No window selected."
#     exit 1
# fi

# #!/usr/bin/env nu
#
# def show_menu [] {
# 	fuzzel --dmenu --index --log-level=none --font=Roboto:size=24 --width=50
# }
#
# # A function for getting windows in the current workspace
# def get_workspace_windows [] {
# 	let active_window = hyprctl -j activewindow | from json
# 	hyprctl -j clients | from json | where workspace.id == $active_window.workspace.id
# }
#
# # Choose between the "get_windows" and "get_workspace_windows" functions
# let windows = get_workspace_windows | sort-by focusHistoryID
#
# # If there is only one window or no windows, there is no need to show a menu
# if ( $windows | length ) <= 1 {
# 	exit
# }
#
# # Capture the output of the menu
# let window_index = $windows | get title | to text | show_menu
#
# if $window_index != "" {
#
# 	let window = $windows | get ($window_index | into int)
#
# 	# Prepend address with "address:" to make it a valid address for hyprctl
# 	let window_address = $window.address | str replace -r '^' 'address:'
# 	let hyprctl_output = hyprctl dispatch focuswindow $window_address
# 	if $hyprctl_output != "ok" and $hyprctl_output != "" {
# 		echo $hyprctl_output
# 	}
# }
