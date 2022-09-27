#!/usr/bin/env bash

## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3
## Autostart Programs

# Kill already running process
_ps=(picom dunst xfsettingsd spotifyd conky ntfd playerctld ksuperkey ntfd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr

# polkit agent
if [[ ! `pidof xfce-polkit` ]]; then
	/usr/lib/xfce-polkit/xfce-polkit &
fi

# Weather Daemon
ntfd &

# Start Music Player Daemon
playerctld &

# Spotify Daemon
spotifyd &

## Thunar Daemon
#thunar --daemon &

# Enable power management
xfce4-power-manager &

## xfce4-settings daemon
xfsettingsd &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Restore wallpaper
nitrogen --restore

# Conky widget
~/.config/conky/Fornax/start.sh

# Lauch notification daemon
~/.xmonad/bin/xmodunst.sh

# Lauch polybar
~/.xmonad/bin/xmobar.sh

# Lauch compositor
~/.xmonad/bin/xmocomp.sh

# Start mpd
#exec mpd &
