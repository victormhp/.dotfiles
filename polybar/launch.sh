#!/usr/bin/env bash

dir="$HOME/.config/polybar/material/"
themes=(`ls --hide="launch.sh" $dir`)

launch_bar() {
    # Terminate already running bar instances
    killall -q polybar

    # Wait until the processes have been shut down
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    # Launch the bar
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar -q main -c "$dir"/config.ini &
    done
}

launch_bar
