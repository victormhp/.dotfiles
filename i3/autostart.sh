#!/usr/bin/env bash

nitrogen --restore &

killall polybar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload  &

    if [ $"m" != "eDP" ]; then
        xrandr --output "$m" --primary
        xrandr --output "$m" --left-of eDP
    fi
done

picom
