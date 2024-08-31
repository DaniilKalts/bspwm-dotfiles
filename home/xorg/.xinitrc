#!/bin/sh

# __   _______ _   _ _____ _______ _____  _____   _____
# \ \ / /_   _| \ | |_   _|__   __|  __ \|  __ \ / ____|
#  \ V /  | | |  \| | | |    | |  | |__) | |__) | |
#   > <   | | | . ` | | |    | |  |  _  /|  _  /| |
#  / . \ _| |_| |\  |_| |_   | |  | | \ \| | \ \| |____
# /_/ \_\_____|_| \_|_____|  |_|  |_|  \_\_|  \_\\_____|

# Set the resolution for Virtual-1
xrandr --output Virtual-1 --mode 1920x1080

# Set the keyboard layout to US and Russian, with Alt+Shift to toggle
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"

# Set the wallpaper
# feh --bg-scale Pictures/wallpapers/magic_anime_girl.jpg

# Start bspwm
exec bspwm
