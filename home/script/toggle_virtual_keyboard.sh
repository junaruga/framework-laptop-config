#!/bin/bash

set -eu

# Set the wvkbd-mobintl file path.
KBD_PROG="${HOME}/bin/wvkbd-mobintl"
KBD_PROG_NAME="$(basename "${KBD_PROG}")"

PID="$(pgrep "${KBD_PROG_NAME}")" || :
if [ "${PID}" = "" ]; then
    "${KBD_PROG}" \
        -H 500 \
        -L 400 \
        --fn "Monospace 40" \
        --hidden \
        --alpha 204 \
        &
    PID="$(pgrep "${KBD_PROG_NAME}")"
fi

# Toogle
kill -s SIGRTMIN "${PID}"
