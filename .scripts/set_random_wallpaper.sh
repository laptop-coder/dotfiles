#!/bin/bash
PATH_TO_RANDOM_WALLPAPER=$(find $HOME/wallpapers -maxdepth 1 -type f | shuf -n 1)
NAME=$(basename $PATH_TO_RANDOM_WALLPAPER)
cp "$HOME/wallpapers/lock_screen/$NAME" "$HOME/wallpapers/lock_screen/current"
swaybg -m fill -i $PATH_TO_RANDOM_WALLPAPER

