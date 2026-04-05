# My shell configuration
{
  pkgs,
  lib,
  config,
  ...
}:
# let fetch = config.var.theme.fetch; # neofetch, nerdfetch, pfetch
# in {
{
  home.packages = with pkgs; [
    zoxide
    bat
    ripgrep
    tldr
    sesh
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.sessionPath = [ "$HOME/go/bin" ];

  programs.zsh = {

    initContent = lib.mkBefore ''
               setopt EXTENDED_HISTORY;
      export MAMBA_EXE='/nix/store/mw141k4ssdzcpkzxrfl6889arh7jmrva-micromamba-1.5.8/bin/micromamba';
      export MAMBA_ROOT_PREFIX='/home/jonwick/.local/share/micromamba';
      __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__mamba_setup"
      else
          alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
      fi
      unset __mamba_setup
      # <<< mamba initialize <<<
      	eval $(thefuck --alias)

    '';

    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    # initExtraFirst = ''
    #   # bindkey -e
    #   # ${if fetch == "neofetch" then
    #   #   pkgs.neofetch + "/bin/neofetch"
    #   # else if fetch == "nerdfetch" then
    #   #   "nerdfetch"
    #   # else if fetch == "pfetch" then
    #   #   "echo; ${pkgs.pfetch}/bin/pfetch"
    #   # else
    #   #   ""}
    #
    #   function sesh-sessions() {
    #     session=$(sesh list -t -c | fzf --height 70% --reverse)
    #     [[ -z "$session" ]] && return
    #     sesh connect $session
    #   }
    #
    #   zle     -N             sesh-sessions
    #   bindkey -M emacs '\es' sesh-sessions
    #   bindkey -M vicmd '\es' sesh-sessions
    #   bindkey -M viins '\es' sesh-sessions
    # '';

    history = {
      ignoreDups = true;
      save = 10000;
      size = 10000;

    };

    profileExtra = lib.optionalString (config.home.sessionPath != [ ]) ''
      export PATH="$PATH''${PATH:+:}${lib.concatStringsSep ":" config.home.sessionPath}"
    '';

    shellAliases = {
      hm = "nvim ~/.config/home-manager";
      bioinfo = "sudo ssh wickj2@140.160.231.67 -p 59";
      clipLast = ''wl-copy "!!" '';
      clip = "wl-copy";
      sd = "cd ~ && cd $(find * -type d | fzf)";
       nvim = "/home/jonwick/.config/nixvim/result/bin/nvim";
      vim = "nvim";
      vi = "nvim";
      v = "nvim .";
      c = "clear";
      clera = "clear";
      celar = "clear";
      e = "exit";
      cd = "z";
      b = "cd -";

      ls = "eza --icons=always --no-quotes";
      tree = "eza --icons=always --tree --no-quotes";
      sl = "ls";
      open = "${pkgs.xdg-utils}/bin/xdg-open";
      # icat = "${pkgs.kitty}/bin/kitty +kitten icat";
      # ssh = "kitty +kitten ssh";

      wireguard-import = "nmcli connection import type wireguard file";

      notes = "nvim ~/Documents/Notes/Academic-Notes";
      note = "notes";

      # git
      g = "lazygit";
      ga = "git add";
      gc = "git commit";
      gcu = "git add . && git commit -m 'Update'";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
      gd = "git diff";
      gco = "git checkout";
      gcb = "git checkout -b";
      gbr = "git branch";
      grs = "git reset HEAD~1";
      grh = "git reset --hard HEAD~1";

      gaa = "git add .";
      gcm = "git commit -m";
    };
  };

}
