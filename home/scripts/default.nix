{ config, lib, pkgs, ...}:

let 
  cava-internal = pkgs.writeShellScriptBin "cava-internal" ''
    cava -p ~/.config/cava/config | sed -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'
  '';
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    if command -v swww >/dev/null 2>&1; then
      swww img $(find ~/Pictures/Wallpapers/catppucin -type f | shuf -n1) --transition-type wipe
    fi
  '';
  default_wallpaper = pkgs.writeShellScriptBin "default_wallpaper" ''
    if command -v swww >/dev/null 2>&1; then
      swww img ~/Pictures/Wallpapers/catppucin/bluehour.jpg --transition-type wipe
    fi
  '';
in 
{ 
  home.packages = with pkgs; [
    cava-internal
    wallpaper_random
    default_wallpaper
  ];
}
