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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/pollo/.bun/_bun" ] && source "/home/pollo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# anaconda
# export PATH="$HOME/anaconda3/bin:$PATH"  # commented out by conda initialize

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# Starship 
eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/pollo/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pollo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/pollo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/pollo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

