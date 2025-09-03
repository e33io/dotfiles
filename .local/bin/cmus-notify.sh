#!/usr/bin/env bash

# =============================================================================
# Send dunst notifications from cmus
# =============================================================================

[ $# -eq 0 ] && exit 0

if [ "$2" = 'playing' ] ; then
    while [ $# -ge 2 ] ; do
        eval "_$1"='$2'
        shift
        shift
    done

    notification_sum="$_title" 
    notification_body="$_artist - $_album"
    img_file="audio-player"

    dunstify -r 36198 -i "$img_file" "$notification_sum" "$notification_body" \
    && exit 0
fi
