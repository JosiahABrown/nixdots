{ config, pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    zsh = {
      enable = true;
    };
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Apps
    brave
    kitty
    neovim
    networkmanagerapplet
    obsidian
    pavucontrol
    spotify
    signal-desktop
    vimiv-qt
    webcord

    # GUI
    dunst
    libnotify
    hyprland
    rofi-wayland
    swww
    waybar
    wayland-protocols
    wayland-utils
    wlroots
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
    xwayland

    # Screen shot & share
    ffmpeg_6-full
    gphoto2
    grim
    mpv
    slurp

    # Utils
    bat
    busybox
    dmidecode
    jq
    killall
    ncdu
    neofetch
    playerctl
    ripgrep
    scdoc
    stow
    v4l-utils

    # Programming 
    docker
    git
    go
    python311Full

    # misc system
    pipewire
    wl-clipboard

    # Build tools
    cmake
    gcc
    meson
    ninja
  ];
  
  # Fonts
  fonts.fonts = with pkgs; [
    # Nerd fonts
    nerdfonts
    meslo-lgs-nf
  ];

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        });
      })
   ];  
}
