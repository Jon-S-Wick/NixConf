{ config, ... }: {
programs.zsh = {
enable = true;
  enableCompletion = true;
  # autosuggestions.enable = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    ll = "ls -l";
    la = "ls -a";
    doc = "cd ~/Documents/";
    update = "sudo nixos-rebuild switch";
  };
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "thefuck" ];
    theme = "robbyrussell";
  };
};
}
