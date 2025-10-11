# Alias
alias c="clear"
alias cls="clear"
alias vi="nvim"
alias vim="nvim"
alias copy="xclip -selection cliboard"

alias ls="eza --icons"
alias ll="eza -l --icons"
alias la="eza -la --icons"
alias lt="eza --tree --level=2 --icons"
alias lta="eza --tree --level=2 -a --icons"

alias day="brightnessctl set 100%"
alias night="brightnessctl set 1%"

alias lg="lazygit"
alias jn="jupyter-notebook"

alias nomacs="flatpak run org.nomacs.ImageLounge"
alias obsidian="flatpak run md.obsidian.Obsidian"
alias zen="flatpak run app.zen_browser.zen"

# tmux-sessionizer
bindkey -s "^f" "tmux-sessionizer\n"

# paths
export PATH=$PATH:$HOME/.local/bin
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd --shell zsh)"

# zsh stuff
eval "$(starship init zsh)"

source $HOME/.antidote/antidote.zsh
antidote load

