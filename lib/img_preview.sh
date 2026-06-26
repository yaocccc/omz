#!/usr/bin/env bash

declare -r -x DEFAULT_PREVIEW_POSITION="right"
declare -r -x PREVIEW_ID="preview"

TERM_COLUMNS=$(tput cols 2>/dev/null || echo 80)
TERM_LINES=$(tput lines 2>/dev/null || echo 24)

PREVIEW_LEFT=${FZF_PREVIEW_LEFT:-$((TERM_COLUMNS / 2))}
PREVIEW_TOP=${FZF_PREVIEW_TOP:-$((TERM_LINES > 12 ? TERM_LINES - 12 : 0))}
PREVIEW_COLUMNS=${FZF_PREVIEW_COLUMNS:-$((TERM_COLUMNS - PREVIEW_LEFT))}
PREVIEW_LINES=${FZF_PREVIEW_LINES:-12}

function draw_preview {
    local file=$1
    [ -n "$file" ] || return 1

    ueberzugpp cmd -s "$UEBERZUGPP_SOCKET" -i "$PREVIEW_ID" -a add \
        -x "$PREVIEW_LEFT" -y "$PREVIEW_TOP" --max-width "$PREVIEW_COLUMNS" --max-height "$PREVIEW_LINES" \
        -f "$file"
}

function remove_preview {
    ueberzugpp cmd -s "$UEBERZUGPP_SOCKET" -i "$PREVIEW_ID" -a remove
}

case "$1" in
	draw) shift; draw_preview "$@" ;;
	remove) remove_preview ;;
esac
