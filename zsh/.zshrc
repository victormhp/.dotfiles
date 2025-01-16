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

alias copy="xclip -selection cliboard"

# tmux-sessionizer
bindkey -s "^f" "tmux-sessionizer\n"

# paths
export PATH=$PATH:$HOME/go/bin
export PATH="$PATH:/opt/nvim-linux64/bin:$NVIMPATH/nvim"
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH=$PATH:/usr/local/zig:$ZIGPATH/bin

# fnm
FNM_PATH="/home/pollo/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/pollo/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# Starship 
eval "$(starship init zsh)"

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load
