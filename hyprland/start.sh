#!/usr/bin/env bash

# initialize wallpaper daemon
swww init &
# setting wallpaper
swww img ~/Pictures/Wallpapers/bluehour.jpg &

nm-applet --indicator &

waybar &
dunst
