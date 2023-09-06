{ inputs, config, pkgs, ... }:

{
  # ENV 
  environment = {
    variables = {
      EDITOR = "nvim";
    };
    sessionVariables = {
      # Hint Electron apps to use wayland
      NIXOS_OZONE_WL = "1";
    };

    shells = with pkgs; [ zsh ];
  };

  # List services that you want to enable:
  services = {
    # OpenSSH daemon
    openssh.enable = true;

    dbus.enable = true;

    # Configure keymap in X11
    xserver = {
      layout = "us";
      xkbVariant = "";
      enable = true;
      displayManager.sddm.enable = true;
      # Enable touchpad
      libinput.enable = true;
    };

    # sound
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
 
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback.out ];
  boot.kernelModules = [
    "v4l2loopback"
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  users.users.josiah = {
    isNormalUser = true;
    description = "Josiah";
    shell = pkgs.zsh;
    extraGroups = [ 
      "networkmanager" 
      "wheel"
      "docker"
    ];
    packages = with pkgs; [];
  };
   
  # Window manager
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  # Helps enable screen sharing
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Enable sound with pipewire
  # sound.enable = true;
  security.rtkit.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
