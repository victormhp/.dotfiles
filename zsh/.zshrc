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

alias update-antibody='antibody bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh'

# Nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

# Starship
eval "$(starship init zsh)"

if [ -e /home/pollo/.nix-profile/etc/profile.d/nix.sh ]; then . /home/pollo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
