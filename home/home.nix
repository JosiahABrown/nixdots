{ inputs, config, pkgs, ... }: 
{
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./scripts
    ./zsh/zsh.nix
    ./hypr/hyprland.nix
    ./waybar
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
    btop
    htop
    httpie
    cava
  ];

}
