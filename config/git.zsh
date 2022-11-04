export GIT_TERMINAL_PROMPT=1

alias git='git --no-pager'
alias gco='git checkout'
alias gpo='git push origin $(git symbolic-ref --short -q HEAD)'
alias gpl='git pull origin $(git symbolic-ref --short -q HEAD) --ff-only'
alias gd='git diff'
alias gs='git status'
alias gss='git status -s'
alias gpt='git push origin --tags'
alias glt='git tag -n --sort=taggerdate | tail -n ${1-10}'
gat() { git tag -a $1 -m "$2" }
gam() { git add --all && git commit -m "$*" }
gitlog() {
    git --no-pager log --date=format:'%Y-%m-%d %H:%M:%S'  --pretty=format:$1 --graph -n ${2-10} \
}
gll() { gitlog "%h %s" $1 }
glll() { gitlog "%h %cd %cn: %s" $1 }
