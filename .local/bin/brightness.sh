#!/bin/sh

# ================================================================
# Change display brightness with light and send dunst notification
# ----------------------------------------------------------------
# Call script with `brightness.sh up` or `brightness.sh down`
# ================================================================

set -eu

brightness_icon_high="display-brightness-high-symbolic"
brightness_icon_medium="display-brightness-medium-symbolic"
brightness_icon_low="display-brightness-low-symbolic"

brightness=$(light | grep -oE '^[0-9]+')

if [ "$brightness" -ge 66 ]; then
    brightnessicon="$brightness_icon_high"
elif [ "$brightness" -ge 33 ]; then
    brightnessicon="$brightness_icon_medium"
else
    brightnessicon="$brightness_icon_low"
fi

send_notification () {
    dunstify -i "$brightnessicon" "Brightness  $brightness%" \
    -h int:value:"$brightness" -u normal -t 1000 \
    -h string:x-dunst-stack-tag:brightness
}

case $1 in
    up)
        light -A 5 > /dev/null
        send_notification
    ;;
    down)
        light -U 5 > /dev/null
        send_notification
    ;;
esac
