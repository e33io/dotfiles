#!/bin/bash

# ========================================================================
# Save fullscreen or active window screenshot with Xfce Screenshooter and
# send dunst notification, or save selected area screenshot with Flameshot
# ------------------------------------------------------------------------
# Call script with `screenshot.sh fullscreen` or `screenshot.sh window`
# or `screenshot.sh selection`
# ========================================================================

set -eu

notify_icon="applets-screenshooter"
notify_title="Screenshot Saved"
notify_body="view image file in ~/Pictures"
screenshot_file="$HOME/Pictures/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

send_notification () {
    dunstify -i "$notify_icon" "$notify_title" "$notify_body"
}

case $1 in
    fullscreen)
        xfce4-screenshooter -f -s $screenshot_file > /dev/null \
        && send_notification
    ;;
    window)
        xfce4-screenshooter -w -s $screenshot_file > /dev/null \
        && send_notification
    ;;
    selection)
        flameshot gui > /dev/null
    ;;
esac
