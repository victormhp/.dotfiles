#!/bin/bash

set -euo pipefail

DOTFILES_DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
source "$DOTFILES_DIR/utils.sh"

# Link entire configuration folders
link_same        "$DOTFILES_DIR/ghostty"     "$HOME/.config/ghostty"
link_same        "$DOTFILES_DIR/picom"       "$HOME/.config/picom"
link_same        "$DOTFILES_DIR/rofi"        "$HOME/.config/rofi"
link_same        "$DOTFILES_DIR/autostart"   "$HOME/.config/autostart"
link_same        "$DOTFILES_DIR/wallpapers"  "$HOME/Pictures/wallpapers"

# Link just files instead of entire folders to avoid
# polluting this dotfiles directory with generated files
link_same_files  "$DOTFILES_DIR/nitrogen"   "$HOME/.config/nitrogen"
link_same_files  "$DOTFILES_DIR/nvim"       "$HOME/.config/nvim"
link_same_files  "$DOTFILES_DIR/i3"         "$HOME/.config/i3"
link_same_files  "$DOTFILES_DIR/i3status"   "$HOME/.config/i3status"

# Link just one file
link_same_single "$DOTFILES_DIR/tmux"     '.tmux.conf'          "$HOME"
link_same_single "$DOTFILES_DIR/tmux"     'tmux-sessionizer'    "$HOME/.local/bin"
link_same_single "$DOTFILES_DIR/zsh"      '.zshrc'              "$HOME"
link_same_single "$DOTFILES_DIR/zsh"      '.zsh_plugins.txt'    "$HOME"
link_same_single "$DOTFILES_DIR/zsh"      'starship.toml'       "$HOME/.config"

echo -e "\033[0;32mLinked all configuration files\033[0m"
