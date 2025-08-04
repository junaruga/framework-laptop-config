#!/bin/bash

set -euo pipefail

# Close the current focusing window.
# swaymsg kill

if ! pgrep swaynag > /dev/null; then
    # Print a warning message to close the window.
    swaynag \
        -t warning \
        -m 'Do you want to close the current focusing window?' \
        -b 'Yes, close window' 'swaymsg kill' \
        -s "No / Close this notification"
else
    pkill swaynag
fi
