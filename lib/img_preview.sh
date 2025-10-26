#!/usr/bin/env bash

declare -r -x DEFAULT_PREVIEW_POSITION="right"
declare -r -x PREVIEW_ID="preview"

source $OMZ/cache/cursor
X=$(($COLUMNS / 2 + 2))
Y=$((row + 2))
if [ $Y -gt $((LINES - 11)) ]; then
    Y=$((LINES - 11))
fi

function draw_preview {
    ueberzugpp cmd -s $UEBERZUGPP_SOCKET -i $PREVIEW_ID -a add \
        -x $X -y $Y --max-width $(($COLUMNS / 2 - 2)) --max-height 10 \
        -f ${@}
}

function remove_preview {
    ueberzugpp cmd -s $UEBERZUGPP_SOCKET -i $PREVIEW_ID -a remove
}

case "$1" in
	draw) shift; draw_preview $* ;;
	remove) remove_preview ;;
esac
