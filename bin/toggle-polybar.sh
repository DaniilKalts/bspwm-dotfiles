#!/bin/sh

# Function to set top_padding for all monitors
set_top_padding() {
  local padding=$1
  for monitor in $(bspc query -M --names); do
    bspc config -m "$monitor" top_padding "$padding"
  done
}

# Check if polybar is running
if pgrep -x polybar >/dev/null; then
  # Polybar is running; kill it and remove top padding
  killall polybar
  set_top_padding 0
else
  # Polybar is not running; launch it and set top padding
  $HOME/.config/polybar/launch.sh
  set_top_padding 31
  # Restart bspwm to apply changes
  bspc wm -r
fi
