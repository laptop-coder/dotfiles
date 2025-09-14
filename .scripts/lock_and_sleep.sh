#!/bin/bash
swayidle -w \
    timeout 900 'hyprlock' \
    before-sleep 'hyprlock'
