#!/usr/bin/env bash

declare -r -x DEFAULT_PREVIEW_POSITION="right"
declare -r -x UEBERZUG_FIFO="$(mktemp --dry-run --suffix "fzf-$$-ueberzug")"
declare -r -x PREVIEW_ID="preview"

function start_ueberzug {
    mkfifo "${UEBERZUG_FIFO}"
    <"${UEBERZUG_FIFO}" \
        ueberzug layer --parser bash --silent &
    3>"${UEBERZUG_FIFO}" \
        exec
}

function finalise {
    3>&- \
        exec
    &>/dev/null \
        rm "${UEBERZUG_FIFO}"
    &>/dev/null \
        kill $(jobs -p)
    killall ueberzug
}

function draw_preview {
    source $OMZ/cache/cursor
    X=$(($COLUMNS / 2 + 2))
    Y=$((row + 2))
    if [ $Y -gt $((LINES - 11)) ]; then
        Y=$((LINES - 11))
    fi

    >"${UEBERZUG_FIFO}" declare -A -p cmd=( \
        [action]=add [identifier]="${PREVIEW_ID}" \
        [x]="${X}" [y]="${Y}" \
        [width]="$(($COLUMNS / 2 - 2))" [height]="10" \
        [scaler]=forced_cover [scaling_position_x]=0.5 [scaling_position_y]=0.5 \
        [path]="${@}")
}

trap finalise EXIT
start_ueberzug
draw_preview $*
sleep 999999
