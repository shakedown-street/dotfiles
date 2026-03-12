# homebrew

eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# fzf

source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--layout reverse --border"

# zoxide
# NOTE: zoxide README says to place this after compinit

eval "$(zoxide init zsh)"

# make helix default editor

export EDITOR="hx"
export VISUAL="hx"

# path home bin folder

export PATH="$PATH:$HOME/bin"
