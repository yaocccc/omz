#! /usr/bin/env sh
mime=$(file -bL --mime-type "$1")
category=${mime%%/*}
if [ -d "$1" ]; then
    exa -l --no-user --no-time --icons --no-permissions --no-filesize "$1" 2>/dev/null || ls --color=always "$1" 2>/dev/null || ls -G "$1"
elif [ "$category" = text ]; then
    (bat -p --color=always "$1" || cat "$1") 2>/dev/null | head -1000
elif [ "$category" = image ]; then
    command -v ueberzug 2&>/dev/null && bash $OMZ/lib/img_preview.sh "$1"|| img2txt "$1"
else 
    echo $1 is a $category file
    (bat -p --color=always "$1" || cat "$1") 2>/dev/null | head -1000
fi
