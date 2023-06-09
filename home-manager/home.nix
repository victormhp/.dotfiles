{ config, pkgs, ... }:

{
  home.username = "pollo";
  home.homeDirectory = "/home/pollo";
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
	exa bat cpufetch
  	zsh antibody starship
	stow
	fzf ripgrep
    nodejs_18 lua
	tmux
	(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Meslo" ]; })
  ];
}
