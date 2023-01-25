#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
#polybar-msg cmd quit
# Launch Polybar, using default config location ~/.config/polybar/config
#polybar primary 2>&1 | tee -a /tmp/polybar.log & disown

source "${HOME}/.cache/wal/colors.sh"
background=$color0
foreground=$color7
tertiary=$color2
fourth=$color4

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload primary &
  done
else
  polybar --reload primary &
fi

echo "Polybar launched..."
