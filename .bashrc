# .bashrc for Debian Linux

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set bash history
HISTCONTROL=ignoredups:erasedups
HISTSIZE=4000
HISTFILESIZE=8000

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size and update
shopt -s checkwinsize

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set editor
export EDITOR="micro"
export VISUAL="micro"

# Set command prompt
PS1='\[\e[01;34m\]\w/\[\e[m\]\[\e[01;32m\]\$\[\e[m\] '

# Set terminal title
PS1="\[\e]0;\w\a\]$PS1"

# Colorize ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# Remove green background from other-writable dirs
export LS_COLORS=$LS_COLORS:'ow=1;34:'
# ls aliases
alias la='ls -A'
alias ll='ls -alF'
alias l='ls -CF'

# Set fzf command to include hidden files and dirs
export FZF_DEFAULT_COMMAND="find . -printf '%P\n'"

# Reload daemons
alias daemon-reload='sudo systemctl daemon-reload'

# Reboot and power off
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'

# Select wifi connection
alias wifi='nmtui connect'

# Remove list of recently used files
alias remove-recent='rm -rf ~/.local/share/recently-used.xbel'

# Strip exif metadata from images, usage: strip-images path-to-file-or-directory
alias strip-images='exiftool -overwrite_original -recurse -all= -TagsFromFile @ -ColorSpaceTags'

# Create new note file with timestamped file name
alias new-note='micro "$HOME/Documents/note_$(date +"%m-%d-%y_%H-%M-%S").txt"'
