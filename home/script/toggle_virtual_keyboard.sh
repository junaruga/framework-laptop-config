#!/bin/bash

set -eu

# Add PATH for the searched commands.
PATH="$PATH:$HOME/bin" \
PROG="wvkbd-deskintl"

if ! pgrep "${PROG}" > /dev/null; then
    "${PROG}" \
        --fn "Monospace 22" \
        --hidden \
        --alpha 204 \
        &
        # --fn "Sans 22"
fi

# Toggle
pkill --signal SIGRTMIN "${PROG}"
