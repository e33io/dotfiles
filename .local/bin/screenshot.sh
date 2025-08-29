#!/bin/bash

# =============================================================================
# Save fullscreen, active window, or selected area screenshots with scrot
# -----------------------------------------------------------------------------
# Call script with `screenshot.sh fullscreen` or `screenshot.sh window`
# or `screenshot.sh selection`
# =============================================================================

set -eu

notify_icon="applets-screenshooter"
notify_title="Screenshot Saved"
notify_body="view image file in ~/Pictures"
notify_sound="/usr/share/sounds/freedesktop/stereo/camera-shutter.oga"
screenshot_file="$HOME/Pictures/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

send_notification () {
    dunstify -i "$notify_icon" "$notify_title" "$notify_body"
    mpv $notify_sound
}

case $1 in
    fullscreen)
        scrot $screenshot_file
        send_notification
    ;;
    window)
        scrot -u -b $screenshot_file
        send_notification
    ;;
    selection)
        sleep 0.2
        scrot -f -l width=2,color="#ff0000" -s $screenshot_file
        send_notification
    ;;
esac
