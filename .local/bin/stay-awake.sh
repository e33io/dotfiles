#!/bin/bash

# ==========================================================================
# Use "Stay Awake ON" to disable screen blanking and locking (like Caffeine)
# or use "Stay Awake OFF" re-enable screen blanking and locking
# --------------------------------------------------------------------------
# Call script with `stay-awake.sh on-desktop` or `stay-awake.sh off-desktop`
# for desktop-specific commands, or `stay-awake.sh on-laptop` or
# `stay-awake.sh off-laptop` for laptop-specific commands
# ==========================================================================

set -eu

notify_icon="caffeine"
notify_title_on="Stay Awake ON"
notify_title_off="Stay Awake OFF"
notify_body_on="Disable screen blanking and locking"
notify_body_off="Re-enable screen blanking and locking"

notification_on () {
    dunstify -i "$notify_icon" "$notify_title_on" "$notify_body_on"
}

notification_off () {
    dunstify -i "$notify_icon" "$notify_title_off" "$notify_body_off"
}

case $1 in
    on-desktop)
        xset s off -dpms
        notification_on
    ;;
    off-desktop)
        xset s on +dpms
        notification_off
    ;;
    on-laptop)
        xset s off -dpms
        xautolock -exit
        notification_on
    ;;
    off-laptop)
        xset s on +dpms
        xautolock -time 5 -locker "systemctl suspend" -detectsleep
        notification_off
    ;;
esac
