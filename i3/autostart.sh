#!/usr/bin/env bash

# Get the names of connected monitors
connected_monitors=$(xrandr --query | grep " connected" | cut -d" " -f1)

# Iterate through the connected monitors
for monitor in $connected_monitors; do
    # Skip the laptop screen
    if [ "$monitor" != "eDP" ]; then
        xrandr --output HDMI-A-0 --primary
        xrandr --output "$monitor" --left-of eDP
        break
    fi
done

nitrogen --restore &
picom
