# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/pollo/.zsh/completions:"* ]]; then export FPATH="/home/pollo/.zsh/completions:$FPATH"; fi

# Alias
alias c="clear"
alias cls="clear"
alias vi="nvim"
alias vim="nvim"
alias copy="xclip -selection cliboard"

alias ls="exa --icons -s type"
alias ll="exa -l --icons -s type"
alias la="exa -la --icons -s type"
alias lt="exa --tree --level=2 --icons -s type"
alias lta="exa --tree --level=2 -a --icons -s type"

alias lg="lazygit"
alias jn="jupyter notebook"

alias nomacs="flatpak run org.nomacs.ImageLounge"
alias obsidian="flatpak run md.obsidian.Obsidian"
alias zen="flatpak run app.zen_browser.zen"

# tmux-sessionizer
bindkey -s "^f" "tmux-sessionizer\n"

# paths
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/opt/nvim-linux64/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/zig
export PATH=$PATH:/usr/local/Postman/

eval "$(starship init zsh)"

source $HOME/.antidote/antidote.zsh
antidote load

# fnm
FNM_PATH="/home/pollo/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/pollo/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# deno
. "/home/pollo/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit
