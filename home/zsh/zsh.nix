{ 
 programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      la = "ls -a";
      lla = "ls -al";
      rebuild = "cd /etc/nixos/ && sudo nixos-rebuild --flake .# switch && cd -";
      nix-config = "cd /etc/nixos && sudo -E nvim flake.nix";
      v = "nvim";
      _ = "sudo";
      ga = "git add";
      gaa = "git add -A";
      gcm = "git commit -m";
      up = "cd ..";  
      webcam = "gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0";
      h = "history";
      hg = "history | grep";
      path="echo $PATH | tr ':' '\n'";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "docker-compose" 
        "docker" 
        "git"
      ];
      theme = "refined";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
