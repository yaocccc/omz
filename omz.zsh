export OMZ=$(cd $(dirname $0);pwd)
source $OMZ/config/omz.zsh
source $OMZ/config/git.zsh
source $OMZ/config/fzf.zsh
source $OMZ/config/hook.zsh
source $OMZ/themes/simple.zsh-theme

# configuration
[ "$_OMZ_APPLY_PREEXEC_HOOK" = "true" ] && _apply_preexec_hook  # file: $OMZ/config/hook.zsh
[ "$_OMZ_APPLY_CHPWD_HOOK" = "true" ] && _apply_chpwd_hook      # file: $OMZ/config/hook.zsh
[ "$_OMZ_APPLY_HISTORYBYFZF" = "false" ] || _apply_historybyfzf # file: $OMZ/config/fzf.zsh
