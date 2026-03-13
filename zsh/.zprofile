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

# load machine-specific config if it exists
[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local
