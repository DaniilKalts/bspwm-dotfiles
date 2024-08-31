#!/usr/bin/env bash
#  ██╗    ██╗ █████╗ ██╗     ██╗     ██████╗  █████╗ ██████╗ ███████╗██████╗
#  ██║    ██║██╔══██╗██║     ██║     ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
#  ██║ █╗ ██║███████║██║     ██║     ██████╔╝███████║██████╔╝█████╗  ██████╔╝
#  ██║███╗██║██╔══██║██║     ██║     ██╔═══╝ ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗
#  ╚███╔███╔╝██║  ██║███████╗███████╗██║     ██║  ██║██║     ███████╗██║  ██║
#   ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝
#
#  ██╗      █████╗ ██╗   ██╗███╗   ██╗ ██████╗██╗  ██╗███████╗██████╗
#  ██║     ██╔══██╗██║   ██║████╗  ██║██╔════╝██║  ██║██╔════╝██╔══██╗
#  ██║     ███████║██║   ██║██╔██╗ ██║██║     ███████║█████╗  ██████╔╝
#  ██║     ██╔══██║██║   ██║██║╚██╗██║██║     ██╔══██║██╔══╝  ██╔══██╗
#  ███████╗██║  ██║╚██████╔╝██║ ╚████║╚██████╗██║  ██║███████╗██║  ██║
#  ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
#  gh0stzk - https://github.com/gh0stzk/dotfiles
#  Info    - This script runs the rofi launcher, to select
#             the wallpapers included in the theme you are in.
#        08.12.2023 08:37:20

# Verifies if xdpyinfo and imagemagick are installed
for app in xorg-xdpyinfo imagemagick; do
	if ! pacman -Qq $app >/dev/null 2>&1; then
		notify-send "Missing package" "Please install the $app package to continue" -u critical
		exit 1
	fi
done

# Set some variables
wall_dir="$HOME/Pictures/wallpapers"
cacheDir="$HOME/.cache/$USER/wallpapers"
rofi_theme="$HOME/dotfiles/rofi/.config/rofi/themes/WallSelect.rasi"

# Create cache dir if it doesn't exist
mkdir -p "${cacheDir}"

# Convert images in directory and save to cache dir
for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
	[ -f "$imagen" ] || continue
	nombre_archivo=$(basename "$imagen")
	if [ ! -f "${cacheDir}/${nombre_archivo}" ]; then
		magick "$imagen" -resize 500x500^ -gravity center -extent 500x500 "${cacheDir}/${nombre_archivo}"
	fi
done

# Launch rofi
wall_selection=$(find "${wall_dir}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A; do echo -en "$A\x00icon\x1f${cacheDir}/$A\n"; done | rofi -dmenu -theme "$rofi_theme" -kb-row-left 'h' -kb-row-right 'l')

# Set wallpaper and make it persistent
if [[ -n "$wall_selection" ]]; then
	feh --no-fehbg --bg-fill "${wall_dir}/${wall_selection}"
	echo "feh --no-fehbg --bg-fill '${wall_dir}/${wall_selection}'" >~/.fehbg
	chmod +x ~/.fehbg
fi
