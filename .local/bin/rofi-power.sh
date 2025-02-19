#!/usr/bin/env bash

# =======================================================
# Rofi power menu script (lock, logout, reboot, shutdown)
# =======================================================

declare -a options=(
    "Lock"
    "Logout"
    "Reboot"
    "Shutdown"
    "Cancel"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -no-show-icons \
       -p "power menu" -config "~/.config/rofi/config.rasi") || exit 0

case $choice in
    "Lock")
        loginctl lock-session
        #i3lock -c 252525
    ;;
    "Logout")
        loginctl terminate-user $(whoami)
    ;;
    "Reboot")
        systemctl reboot
    ;;
    "Shutdown")
        systemctl poweroff
    ;;
    *)
        exit 0
    ;;
esac
