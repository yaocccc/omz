# auto update the terminal name
preexec_hook() { _cmd=($(echo $2)); print -n "\e]2;${(q)_cmd[1]}\a"; }
add-zsh-hook -Uz preexec preexec_hook

# auto to last pwd
chpwd_hook() { echo $PWD > $ZSH/cache/currentdir }
add-zsh-hook -Uz chpwd chpwd_hook
currentdir=$(cat $ZSH/cache/currentdir 2>/dev/null)
[ -d "$currentdir" ] && cd $currentdir
