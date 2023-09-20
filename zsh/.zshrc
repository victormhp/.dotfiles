# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

source ${HOME}/.zsh_plugins.sh

# Alias
alias cls="clear"
alias vi=nvim
alias vim=nvim
alias ls="ls --color=auto"

alias l="exa --icons"
alias ll="exa -l --icons"
alias la="exa -la --icons"
alias lt="exa --tree --level=2 --icons"

alias zplugins='antibody bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh'

# Starship
eval "$(starship init zsh)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/pollo/.bun/_bun" ] && source "/home/pollo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# anaconda
export PATH="$HOME/anaconda3/bin:$PATH"

