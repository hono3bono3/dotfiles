export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODE_PATH=$HOME/.nodebrew/current/lib/node_modules

# direnv
export EDITOR=code
eval "$(direnv hook zsh)"

# git
autoload -Uz compinit && compinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info; }
precmd_functions+=(precmd_vcs_info)
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
PROMPT='%. %# '
zstyle ':vcs_info:git:*' formats '%b'

# cdr
autoload -Uz cdr

alias cdd='fzf-cdr'
function fzf-cdr() {
    local target_dir
    target_dir=$(cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf)
    target_dir=$(echo ${target_dir/\~/$HOME})
    if [ -n "$target_dir" ]; then
        cd "$target_dir" || exit
    fi
}

alias cdg='fzf-ghq-list'
function fzf-ghq-list() {
    local target_dir
    target_dir=$(ghq list -p | fzf)
    target_dir=$(echo "${target_dir/\~/$HOME}")
    if [ -n "$target_dir" ]; then
        cd "$target_dir" || exit
    fi
}

alias gadd='fzf-git-add'
function fzf-git-add() {
    local selected
    selected=$(git status -s | fzf -m --ansi --preview="echo {} | awk '{print \$2}' | xargs git diff --color" | awk '{print $2}')
    if [[ -n "$selected" ]]; then
        git add ${@:1} $(paste -s - <<<"$selected")
    fi
}
