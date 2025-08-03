#!/bin/bash

set -euo pipefail

# swaymsg kill
swaynag \
    -t warning \
    -m 'Do you want to close the current focusing window?' \
    -b 'Yes, close window' 'swaymsg kill' \
    -s "No / Close this notification"
pkill swaynag
