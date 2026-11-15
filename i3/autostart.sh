#!/usr/bin/env bash

local_config="${XDG_CONFIG_HOME:-$HOME/.config}/i3/autostart.local.sh"
if [[ -f $local_config ]]; then
    source "$local_config"
else
    outputs=$(xrandr --query)
    if [[ $outputs == *"HDMI-2 connected"* && $outputs == *"eDP-1 connected"* ]]; then
        xrandr --output HDMI-2 --same-as eDP-1
    fi
fi
setxkbmap -option caps:escape
nitrogen --restore &
pgrep -x picom > /dev/null || picom -b
