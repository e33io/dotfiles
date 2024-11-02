# .profile for Debian Linux

# If running bash
if [ -n "$BASH_VERSION" ]; then
    # Include ~/.bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Set PATH to include user's private ~/bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Set PATH to include user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Run X client utilities
if [ ! -t 0 ] ; then
    # Set root background color
    xsetroot -solid "#0b2f5a" &
    # Load ~/.Xresources
    xrdb ~/.Xresources &
fi

# Set HiDPI scaling (based on Xft.dpi: 192)
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=96

# Set Qt theming
export QT_QPA_PLATFORMTHEME=qt5ct

# Set XSecureLock options
#export XSECURELOCK_AUTH_FOREGROUND_COLOR="#eeeeee"
#export XSECURELOCK_FONT="Inter:size=15"
#export XSECURELOCK_BLANK_TIMEOUT="1"
#export XSECURELOCK_BLANK_DPMS_STATE="off"
#export XSECURELOCK_SHOW_KEYBOARD_LAYOUT="0"
#export XSECURELOCK_KEY_XF86AudioMute_COMMAND="pactl set-sink-mute @DEFAULT_SINK@ toggle"
#export XSECURELOCK_KEY_XF86AudioLowerVolume_COMMAND="pactl set-sink-volume @DEFAULT_SINK@ -5%"
#export XSECURELOCK_KEY_XF86AudioRaiseVolume_COMMAND="pactl set-sink-volume @DEFAULT_SINK@ +5%"
#export XSECURELOCK_KEY_XF86AudioPrev_COMMAND="playerctl --all-players previous"
#export XSECURELOCK_KEY_XF86AudioPlay_COMMAND="playerctl --all-players play-pause"
#export XSECURELOCK_KEY_XF86AudioNext_COMMAND="playerctl --all-players next"
