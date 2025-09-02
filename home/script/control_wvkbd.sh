#!/bin/bash

set -eu

# Add PATH for the searched commands.
PATH="$PATH:$HOME/bin" \
PROG="wvkbd-split"

# SIGUSR1 = hide, SIGUSR2 = show, SIGRTMIN = toggle
SIGNAL="SIGRTMIN"
if [ "${#}" -gt 0 ]; then
    SIGNAL="${1}"
fi

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

pkill --signal "${SIGNAL}" "${PROG}"
