#!/bin/sh
swayidle -w \
    timeout 300 'hyprlock' \
    before-sleep 'hyprlock'
