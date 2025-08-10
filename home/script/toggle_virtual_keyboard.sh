#!/bin/bash

set -eu

# Add PATH for the searched commands.
PATH="$PATH:$HOME/bin" \
PROG="wvkbd-deskintl"

if ! pgrep "${PROG}" > /dev/null; then
    "${PROG}" \
        --fn "Sans 20" \
        --hidden \
        --alpha 204 \
        &
fi

# Toggle
pkill --signal SIGRTMIN "${PROG}"
