{ inputs, config, pkgs, ... }:

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

  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3" # for etcher
  ];

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
    xfce.thunar

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
    etcher
    jq
    killall
    ncdu
    neofetch
    playerctl
    polkit
    ripgrep
    scdoc
    stow
    v4l-utils

    # Programming 
    docker
    docker-compose
    git
    go
    hugo
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
  fonts.packages = with pkgs; [
    # Nerd fonts
    nerdfonts
    meslo-lgs-nf
  ];
}
