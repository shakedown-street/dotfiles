HISTSIZE=100000
SAVEHIST=100000

# opts
setopt HIST_IGNORE_DUPS
setopt PROMPT_SUBST

# env
export EDITOR="nvim"
export VISUAL="nvim"

# path 
export PATH="$HOME/bin:$PATH"

# homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null 2>&1; then
    if [[ -z "$VIRTUAL_ENV" ]]; then
        eval "$(pyenv init - zsh)"
    fi
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

# completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

# fzf
if command -v fzf >/dev/null; then
    source <(fzf --zsh)
    export FZF_DEFAULT_OPTS="--height 40% --layout reverse --border"
fi

# zoxide
if command -v zoxide >/dev/null; then
    eval "$(zoxide init zsh)"
fi

# prompt
zstyle ":vcs_info:git:*" formats "%F{yellow} (%b)%f"
zstyle ":vcs_info:git:*" actionformats "%F{yellow} (%b|%a)%f"
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
add-zsh-hook precmd vcs_info
PROMPT=$'%F{green}%n@%m%f:%F{blue}%~%f${vcs_info_msg_0_} $ '

# fix backwards/forwards word and delete word keybindings in zellij
bindkey "^[f" forward-word
bindkey "^[b" backward-word
bindkey "^[^?" backward-kill-word

# aliases
alias reload="source $HOME/.zshrc"
alias ls="ls -G"
alias ll="ls -lhG"
alias la="ls -lhaG"
alias grep="grep --color=auto"
alias man="batman"
alias gs="git status"
alias gcg="git config --edit --global"
alias gcl="git config --edit --local"
alias ide="zellij --layout ~/.config/zellij/layouts/ide.kdl"
alias mkvenv="python -m venv .venv"
alias venv="source .venv/bin/activate"
alias treegit="tree -a -I .git"
alias marsha="pbcopy < $HOME/marsha.txt"
# alias --help to use bat
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# pipes rg output to fzf and opens selection in nvim at matching line
seer() {
    rg -S --hidden --line-number --no-heading --color=always --glob '!.git/*' "$@" \
    | fzf --ansi --delimiter ':' \
        --height "100%" --layout reverse --border \
        --preview 'bat --style=numbers --color=always {1} --highlight-line {2}' \
        --bind 'enter:execute(nvim +{2} {1})'
}

# creates a script, makes it executable, and opens it in nvim
mkscript() {
    local name="$1"
    if [[ ! -f "$name" ]]; then
        printf '%s\n\n' '#!/usr/bin/env bash' > "$name"
        chmod +x "$name"
    fi
    nvim "$name"
}
