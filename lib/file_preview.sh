#! /usr/bin/env sh
mime=$(file -bL --mime-type "$1")
category=${mime%%/*}
command -v ueberzugpp >/dev/null 2>&1 && [ -n "$UEBERZUGPP_SOCKET" ] && ub_avail="yes"
if [ -d "$1" ]; then
    [ "$ub_avail" = "yes" ] && bash $OMZ/lib/img_preview.sh remove
    exa -l --no-user --no-time --icons --no-permissions --no-filesize "$1" 2>/dev/null || ls --color=always "$1" 2>/dev/null || ls -G "$1"
elif [ "$category" = text ]; then
    [ "$ub_avail" = "yes" ] && bash $OMZ/lib/img_preview.sh remove
    (bat -p --color=always "$1" || cat "$1") 2>/dev/null | head -1000
elif [ "$category" = image ]; then
    [ "$ub_avail" = "yes" ] && bash $OMZ/lib/img_preview.sh draw "$1"|| img2txt "$1"
else 
    echo $1 is a $category file
    (bat -p --color=always "$1" || cat "$1") 2>/dev/null | head -1000
fi
