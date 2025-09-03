#!/usr/bin/env bash

# =============================================================================
# Use "Stay Awake ON" to disable screen blanking and locking (like Caffeine)
# or use "Stay Awake OFF" re-enable screen blanking and locking
# -----------------------------------------------------------------------------
# Call script with `stay-awake.sh on` or `stay-awake.sh off`
# =============================================================================

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
    on)
        xset s off -dpms
        notification_on
    ;;
    off)
        xset s on +dpms
        notification_off
    ;;
esac
