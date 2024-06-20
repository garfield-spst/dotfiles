#!/bin/bash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/scripts/bar/bar_themes/everforest

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b$green^ CPU"
  printf "^c$white^ ^b$grey^ $cpu_val"
}

pkg_updates() {
  updates=$({ timeout 20 pacman -Qu 2>/dev/null || true; } | wc -l)

  if [ "$updates" -eq 0 ]; then
    printf "  ^c$white^  0"
  else
    printf "  ^c$red^  $updates"
  fi
}

mem() {
	printf "^c$blue^^b$black^  "
	printf "^c$blue^ $(free -h | awk '/^Mem/{print $3}' | sed s/i//g)"
}

netspeed() {
        tx=$(cat /sys/class/net/enp37s0/statistics/tx_bytes)
        down=$(numfmt --to=iec --format='%.2f' $tx)
	if [ -z "$down" ]; then
	  printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected"
	else
	  printf "^c$green^  $down"
        fi
}

clock() {
	printf "^c$black^ ^b#6F8FAF^ 󱑆 "
	printf "^c$black^^b#6080A0^ $(date '+%I:%M') "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  #sleep 1 && xsetroot -name "$updates $(cpu) $(mem) ) $(clock)"
  sleep 1 && duskc run_command setstatus 0 "$(pkg_updates) $(cpu) $(mem) $(clock)"
done
