#!/bin/bash

set -euo pipefail

source './utils.sh'

# Link entire configuration folders
link_same        "$(pwd)/alacritty"       "$HOME/.config/alacritty"
link_same        "$(pwd)/picom"           "$HOME/.config/picom"
link_same        "$(pwd)/rofi"           "$HOME/.config/rofi"

# Link just files instead of entire folders to avoid
# polluting this dotfiles directory with generated files
link_same_files  "$(pwd)/nvim"            "$HOME/.config/nvim"
link_same_files  "$(pwd)/vscode"       "$HOME/.config/Code - Insiders/User"
link_same_files  "$(pwd)/i3"              "$HOME/.config/i3"

# Link just one file
link_same_single "$(pwd)" '.tmux.conf'    "$HOME"
link_same_single "$(pwd)/zsh" '.zshrc'    "$HOME"
link_same_single "$(pwd)/zsh" '.zsh_plugins.txt'    "$HOME"
link_same_single "$(pwd)" 'starship.toml' "$HOME/.config"

echo -e "\033[0;32mLinked all configuration files\033[0m"
