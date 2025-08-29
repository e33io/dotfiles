#!/bin/sh

# =============================================================================
# Change display brightness with brightnessctl and send dunst notification
# -----------------------------------------------------------------------------
# Call script with `brightness.sh up` or `brightness.sh down`
# =============================================================================

set -eu

brightness_icon_high="display-brightness-high-symbolic"
brightness_icon_medium="display-brightness-medium-symbolic"
brightness_icon_low="display-brightness-low-symbolic"

brightness="$(brightnessctl i | awk '/Current brightness:/ { print $4 }' | grep -o '[0-9]\+')"
device="$(brightnessctl i | awk '/backlight/ { print $2 }' | grep -o '[a-z_]\+')"

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
        brightnessctl -qd $device s +5%
        send_notification
    ;;
    down)
        brightnessctl -qd $device s 5%-
        send_notification
    ;;
esac
