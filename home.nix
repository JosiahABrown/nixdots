{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/home/zsh/zsh.nix
    # /etc/nixos/home/hypr/hyprland.nix
  ];

  # Info about user and path it manages
  home.username = "josiah";
  home.homeDirectory = "/home/josiah";
 
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces breaking changes.
  home.stateVersion = "23.05";
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # User packages
  home.packages = with pkgs; [
    htop
    httpie
  ];

}
