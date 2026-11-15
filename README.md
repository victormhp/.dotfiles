# Dotfiles

Personal configuration for a Linux/X11 desktop, terminal, shell, and editor.

![Desktop](./wallpapers/desktop.jpg)

## Contents

| Directory | Configuration |
| --- | --- |
| `nvim/` | Neovim 0.12+, native `vim.pack` packages, LSP, completion, Treesitter, Conform, Telescope, and Git integration |
| `i3/` | Window manager, keybindings, and desktop startup |
| `i3status/` | Status bar |
| `rofi/` | Application launcher and theme |
| `picom/` | Compositor |
| `ghostty/` | Terminal appearance |
| `zsh/` | Shell aliases, Antidote plugins, Starship prompt, and direnv integration |
| `tmux/` | Terminal multiplexer and project sessionizer |
| `nitrogen/` | Wallpaper settings |
| `wallpapers/` | Desktop backgrounds |
| `autostart/` | Syncthing desktop autostart entry |

`install.sh` links the configurations into the home directory using the helpers
in `utils.sh`.
