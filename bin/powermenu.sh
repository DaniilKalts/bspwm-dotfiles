#!/bin/env bash

choice=$(printf "Logout\nReboot\nShutdown" | rofi -dmenu -p "Options:" -i)

# Convert the choice to lowercase to handle case insensitivity
choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

case "$choice" in
logout)
	pkill -KILL -u "$USER"
	;;
reboot)
	notify-send "System Update" "Updating system packages before rebooting..."
	sudo pacman -Syu --noconfirm
	sudo systemctl reboot
	;;
shutdown)
	notify-send "System Update" "Updating system packages before shutting down..."
	sudo pacman -Syu --noconfirm
	sudo systemctl poweroff
	;;
esac
