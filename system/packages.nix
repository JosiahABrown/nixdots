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
    bat
    brave
    busybox
    cmake
    dmidecode
    dunst
    docker
    ffmpeg_6-full
    gcc
    git
    go
    gphoto2
    grim
    hyprland
    imv
    jq
    killall
    kitty
    libnotify
    meson
    mpv
    ncdu
    neofetch
    neovim
    networkmanagerapplet
    ninja
    obsidian
    pavucontrol
    pipewire
    playerctl
    python311Full
    ripgrep
    rofi-wayland
    scdoc
    signal-desktop
    slurp
    spotify
    stow
    swww
    v4l-utils
    vimiv-qt
    waybar
    wayland-protocols
    wayland-utils
    webcord
    wl-clipboard
    wlroots
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
    xwayland
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
