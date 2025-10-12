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

# tmux-sessionizer
bindkey -s "^f" "tmux-sessionizer\n"

# paths
export PATH=$PATH:$HOME/.local/bin
# fnm
FNM_PATH="/home/pollo/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# zsh stuff
eval "$(starship init zsh)"

source $HOME/.antidote/antidote.zsh
antidote load



# bun completions
[ -s "/home/pollo/.bun/_bun" ] && source "/home/pollo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
