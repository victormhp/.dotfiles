#!/bin/bash

set -euo pipefail

source './utils.sh'

# Link entire configuration folders
link_same        "$(pwd)/ghostty"     "$HOME/.config/ghostty"
link_same        "$(pwd)/rofi"        "$HOME/.config/rofi"
link_same        "$(pwd)/wallpapers"  "$HOME/Pictures/wallpapers"

# Link just files instead of entire folders to avoid
# polluting this dotfiles directory with generated files
link_same_files  "$(pwd)/nvim"       "$HOME/.config/nvim"
link_same_files  "$(pwd)/vscode"     "$HOME/.config/Code/User"
link_same_files  "$(pwd)/i3"         "$HOME/.config/i3"
link_same_files  "$(pwd)/i3status"   "$HOME/.config/i3status"

# Link just one file
link_same_single "$(pwd)/tmux"     '.tmux.conf'          "$HOME"
link_same_single "$(pwd)/tmux"     'tmux-sessionizer'    "$HOME/.local/bin"
link_same_single "$(pwd)/zsh"      '.zshrc'              "$HOME"
link_same_single "$(pwd)/zsh"      '.zsh_plugins.txt'    "$HOME"
link_same_single "$(pwd)/zsh"      'starship.toml'       "$HOME/.config"

echo -e "\033[0;32mLinked all configuration files\033[0m"
