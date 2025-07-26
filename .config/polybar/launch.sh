#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If your bars have ipc enabled, you can also use `polybar-msg cmd quit`

# Launch Polybar, using default config location ~/.config/polybar/config
polybar i3bar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
