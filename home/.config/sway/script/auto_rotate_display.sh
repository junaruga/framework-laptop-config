#!/bin/bash

set -euo pipefail

monitor-sensor | \
    mawk -W interactive \
    '/Accelerometer orientation changed:/ { print $NF; fflush();}' | \
    while read -r line
do
   case "$line" in
   normal)
       swaymsg output eDP-1 transform 0
       ;;
   bottom-up)
       swaymsg output eDP-1 transform 180
       ;;
  right-up)
       swaymsg output eDP-1 transform 90
       ;;
  left-up)
       swaymsg output eDP-1 transform 270
       ;;
   esac
done
