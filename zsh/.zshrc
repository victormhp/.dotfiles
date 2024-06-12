# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

# Alias
alias c="clear"
alias cls="clear"
alias vi="nvim"
alias vim="nvim"
alias jn="jupyter notebook"
alias ls="ls --color=auto"
alias cat="batcat"

alias l="exa --icons"
alias ll="exa -l --icons"
alias la="exa -la --icons"
alias lt="exa --tree --level=2 --icons"

# tmux-sessionizer
bindkey -s "^f" "tmux-sessionizer\n"

# paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/bin/obsidian"
export PATH="$PATH:/usr/local/go/bin"
export NO_PROXY=localhost,127.0.0.1,::1
export PATH="$PATH":"$HOME/.pub-cache/bin"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Ocaml
eval "$(opam env)"

# Starship 
eval "$(starship init zsh)"

alias luamake=/home/pollo/workspace/sumneko/3rd/luamake/luamake

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

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load


# bun completions
[ -s "/home/pollo/.bun/_bun" ] && source "/home/pollo/.bun/_bun"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
