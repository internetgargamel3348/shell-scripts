#!/usr/bin/env sh

# Tested only with two monitors, possible error in case of using more than that

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch
#polybar named top
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload top&
done
