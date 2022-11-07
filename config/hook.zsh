# auto update the terminal name
_apply_preexec_hook() {
    preexec_hook() { _cmd=($(echo $2)); print -n "\e]2;${(q)_cmd[1]}\a"; }
    add-zsh-hook -Uz preexec preexec_hook
}

# auto to last pwd
_apply_chpwd_hook() {
    chpwd_hook() { echo $PWD > $OMZ/cache/currentdir }
    add-zsh-hook -Uz chpwd chpwd_hook
    currentdir=$(cat $OMZ/cache/currentdir 2>/dev/null)
    [ -d "$currentdir" ] && cd $currentdir
}

[ "$_OMZ_APPLY_PREEXEC_HOOK" != "false" ] && _apply_preexec_hook
[ "$_OMZ_APPLY_CHPWD_HOOK" != "false" ] && _apply_chpwd_hook
