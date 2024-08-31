#!/usr/bin/env bash

# Terminate already running Polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

polybar top -r >>/tmp/polybar1.log 2>&1 &
disown

echo "Polybar launched..."
