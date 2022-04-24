export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODE_PATH=$HOME/.nodebrew/current/lib/node_modules

# git 
autoload -Uz compinit && compinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
PROMPT='%. %# '
zstyle ':vcs_info:git:*' formats '%b'
