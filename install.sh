# Install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# Source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# Home manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Copy home.nix
cp ./home-manager/home.nix ~/.config/home-manager/
home-manager switch

# Stow dotfiles
stow starship
stow tmux
stow zsh

# Add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# Use zsh as default shell
sudo chsh -s $(which zsh) $(whoami)

# Bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
