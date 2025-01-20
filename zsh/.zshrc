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

alias lg="lazygit"

# tmux-sessionizer
bindkey -s "^f" "tmux-sessionizer\n"

# paths
export PATH=$PATH:$HOME/.local/bin
