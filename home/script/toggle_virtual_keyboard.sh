#!/bin/bash

set -eu

# Add PATH for the searched commands.
PATH="$PATH:$HOME/bin" \
PROG="wvkbd-split"

if ! pgrep "${PROG}" > /dev/null; then
    "${PROG}" \
        --hidden \
        --alpha 204 \
        &
    # "${PROG}" \
    #     --hidden \
    #     --alpha 80 \
    #     --non-exclusive \
    #     &
fi

# Toggle
pkill --signal SIGRTMIN "${PROG}"
