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
	neovim tmux
	(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Meslo" ]; })
  ];

  programs.git = {
	enable = true;
    	userName = "victormhp";
    	userEmail = "victoralbertomhp@gmail.com";
  };
}
