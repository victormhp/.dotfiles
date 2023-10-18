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

# paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/bin/obsidian"

# Starship 
eval "$(starship init zsh)"

alias luamake=/home/pollo/workspace/sumneko/3rd/luamake/luamake

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

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

