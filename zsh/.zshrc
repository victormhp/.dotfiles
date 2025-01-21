# Alias
alias c="clear"
alias cls="clear"
alias vi="nvim"
alias vim="nvim"
alias cat="batcat"
alias copy="xclip -selection cliboard"

alias ls="exa --icons -s type"
alias ll="exa -l --icons -s type"
alias la="exa -la --icons -s type"
alias lt="exa --tree --level=2 --icons -s type"
alias lta="exa --tree --level=2 -a --icons -s type"

alias lg="lazygit"
alias jn="jupyter notebook"

alias nomacs="flatpak run org.nomacs.ImageLounge"

# tmux-sessionizer
bindkey -s "^f" "tmux-sessionizer\n"

# paths
export PATH=$PATH:$HOME/.local/bin
