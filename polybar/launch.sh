#!/bin/bash

killall polybar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -r top
  done
else
  polybar -r top
fi
