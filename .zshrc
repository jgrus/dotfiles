#ZSH git repository plugin to get a fancy right hand side prompt
autoload -Uz add-zsh-hook vcs-info
setopt prompt_subst
add-zsh-hook precmd vcs_info
zstyle ':vcs_info' enable git
zstyle ':vcs_info:git*' formats '%u%c %b'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
zstyle ':vcs_info:*:*' check-for-changes true

#Configure the promt
PROMPT='%F{39}%2~%f > '
RPROMPT='${vcs_info_msg_0_}'

#Aliases
alias la="ls -lah"
alias ~="pushd ~"
alias R="R --no-save --no-restore"
