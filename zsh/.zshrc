# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

# Alias
alias cls="clear"
alias vi="vim"
alias vim="nvim"
alias ls="ls --color=auto"
alias bat="batcat"

alias l="exa --icons"
alias ll="exa -l --icons"
alias la="exa -la --icons"
alias lt="exa --tree --level=2 --icons"

# tmux-sessionizer
bindkey -s "^f" "tmux-sessionizer\n"

# scripts directory
export PATH="$HOME/.local/bin:$PATH"

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# Starship 
eval "$(starship init zsh)"
-e 
alias luamake=/home/pollo/workspace/sumneko/3rd/luamake/luamake
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load
