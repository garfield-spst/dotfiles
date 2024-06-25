#!/usr/bin/env bash
# Get list of tmux windows and their IDs
# windows=$(tmux list-windows -F '#I: #W')
windows=$(tmux list-windows -a -F "#S     #W                   #I")

# Select a window using fzf
#selected=$(echo "$windows" | fzf --height 10 --reverse --prompt "window: " --ansi --no-mouse --preview "tmux list-windows -F '#I: #W' | grep -oP '^\d+' | xargs -I {} tmux list-windows -F '#I: #W' -t {}" --preview-window=up:3:wrap)
# selected=$(echo "$windows" | dmenu -p "window: " -l 10 -i -fn "JetBrainsMono-20" -nb "#282828" -nf "#ebdbb2" -sb "#458588" -sf "#ebdbb2")
selected=$(echo "$windows" | fuzzel --dmenu --log-level=none --prompt=" :  " --layer=overlay --font=JetBrainsMono:weight=Bold:size=25 --line-height=28 --width=25)
# echo "$selected"

# Extract the window ID
window_id=$(echo "$selected" | awk '{print $3}')
session_id=$(echo "$selected" | awk '{print $1}')
# echo "$session_id"
# echo "$window_id"

if [ -z "$session_id" ] || [ -z "$window_id" ]; then
  exit 1
fi

# Switch to the selected window
# tmux select-window -t $window_id
# tmux select-window -t "$session_id":"$window_id"
tmux switch-client -t "$session_id" \; select-window -t "$window_id"
