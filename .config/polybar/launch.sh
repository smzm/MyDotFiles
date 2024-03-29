#!/bin/sh

# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Wait multiple seconds to i3 load completly
sleep 3

polybar main --config=~/.config/polybar/config.ini &
polybar bottom  --config=~/.config/polybar/config.ini &
