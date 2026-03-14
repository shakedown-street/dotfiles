# increase history size
HISTSIZE=100000
SAVEHIST=100000

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--layout reverse --border"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# home bin
export PATH="$HOME/bin:$PATH"

# editor
export EDITOR="hx"
export VISUAL="hx"

# completion
autoload -Uz compinit
compinit -C

zstyle ':completion:*' menu select

# zoxide
# NOTE: zoxide must be placed after compinit
eval "$(zoxide init zsh)"

# prompt
autoload -Uz vcs_info

setopt PROMPT_SUBST

precmd() {
  vcs_info
}

zstyle ":vcs_info:git:*" formats " (%b)"
zstyle ":vcs_info:git:*" actionformats " (%b|%a)"

PROMPT="%F{green}%n@%m%f:%F{blue}%~%f%F{yellow}\${vcs_info_msg_0_}%f $ "

# aliases
alias reload="source $HOME/.zshrc"
alias ls="ls -G"
alias ll="ls -lhG"
alias la="ls -lhaG"
alias grep="grep --color=auto"
alias gs="git status"
alias gcg="git config --edit --global"
alias gcl="git config --edit --local"
alias vim="nvim"
alias ide="zellij --layout ~/.config/zellij/layouts/ide.kdl"
