{ 
 programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      la = "ls -a";
      update = "sudo nixos-rebuild switch";
      v = "nvim";
      _ = "sudo";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "docker-compose" 
        "docker" 
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
