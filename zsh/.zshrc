# Alias
alias c="clear"
alias cls="clear"
alias vi="nvim"
alias vim="nvim"
alias jn="jupyter notebook"
alias ls="ls --color=auto"
alias cat="batcat"

alias l="exa --icons -s type"
alias ll="exa -l --icons -s type"
alias la="exa -la --icons -s type"
alias lt="exa --tree --level=2 --icons -s type"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Load pyenv-virtualenv automatically
eval "$(pyenv virtualenv-init -)"

# tmux-sessionizer
bindkey -s "^f" "tmux-sessionizer\n"

# paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/bin/obsidian"
export NO_PROXY=localhost,127.0.0.1,::1
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/go/bin"

# Starship 
eval "$(starship init zsh)"

alias luamake=/home/pollo/workspace/sumneko/3rd/luamake/luamake

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

# fnm
FNM_PATH="/home/pollo/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/pollo/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
