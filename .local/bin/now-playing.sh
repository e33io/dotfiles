#!/usr/bin/env bash

# =============================================================================
# Send dunst notification of music that's now playing in cmus
# =============================================================================

cmus_query=$(cmus-remote -Q)
title=$(echo "$cmus_query" | grep "tag title " | awk '{ $1=$2=""; $0=$0; } NF=NF')
artist=$(echo "$cmus_query" | grep "tag artist " | awk '{ $1=$2=""; $0=$0; } NF=NF')
album=$(echo "$cmus_query" | grep "tag album " | awk '{ $1=$2=""; $0=$0; } NF=NF')
status=$(echo "$cmus_query" | grep "status" | awk '{ $1=""; $0=$0; } NF=NF')
img_file="audio-player"

if [ $status = "playing" ]; then
    dunstify -r 36198 -i "$img_file" "$title" "$artist - $album"
elif [ $status = "paused" ]; then
    dunstify -r 36198 -i "$img_file" "Paused music" "$title - $artist"
else
    dunstify -r 36198 -i "$img_file" "No music is playing"
fi
