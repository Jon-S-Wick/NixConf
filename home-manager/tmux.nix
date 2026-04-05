# Tmux is a terminal multiplexer that allows you to run multiple terminal sessions in a single window.
{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    prefix = "C-space";
    terminal = "kitty";
    keyMode = "vi";

    extraConfig = ''
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set -gq allow-passthrough on
      bind-key x kill-pane # skip "kill-pane 1? (y/n)" prompt

      bind-key -n C-Tab next-window
      bind-key -n C-S-Tab previous-window
      bind-key -n M-Tab new-window
    '';

    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.resurrect
      tmuxPlugins.sensible
      #tmuxPlugins.tmux-thumbs TODO: Set up
      tmuxPlugins.tmux-which-key

      # tmuxPlugins.tokyo-night-tmux
    ];
  };
}
