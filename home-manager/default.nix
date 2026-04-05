{ pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix

    # ./example.nix - add your modules here
  ];

  # home-manager options go here
  home.packages = [
    pkgs.tmux
    pkgs.vivaldi
    pkgs.zotero
    pkgs.teams-for-linux
    pkgs.asusctl
    pkgs.supergfxctl
    pkgs.gh
    pkgs.protonvpn-gui
    pkgs.brave
    pkgs.obsidian
    pkgs.onlyoffice-desktopeditors
    pkgs.libreoffice-qt6
    pkgs.wpsoffice-cn
    pkgs.kdePackages.partitionmanager
    pkgs.appimage-run

    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
  ];

  # hydenix home-manager options go here
  hydenix = {
    hm = {

      editors = {
        neovim = false;
      };

      enable = true;
      theme = {
        enable = true;
        active = "AbyssGreen";
        themes = [
          "AbyssGreen"
          "Gruvbox Retro"
          "Catppuccin Mocha"
          "Catppuccin Latte"
        ];
      };
      terminals = {
        enable = true; # enable terminals module
        kitty = {
          enable = true; # enable kitty terminal
          configText = "
                      window_padding_width 5
                      

                        "; # kitty config text
        };
      };
      hyprland = {
        shaders.active = "disable";
        extraConfig = "
                                        general {
                    gaps_in = 5
                    gaps_out = 20

                    border_size = 2
                          }

                    "; # extra config appended to userprefs.conf
        keybindings = {
          enable = true; # enable keybindings configurations
          extraConfig = "
                        bindd = $mainMod, F, $d toggle fullscreen, fullscreen
                        bindd = $mainMod, SPACE, $d application finder , exec, pkill -x rofi || $rofi-launch d

                        bindd = $mainMod, h, $d focus left, movefocus, l
                        bindd = $mainMod, l, $d focus right , movefocus, r
                        bindd = $mainMod, k, $d focus up , movefocus, u
                        bindd = $mainMod, j , $d focus down, movefocus, d
                        bindd = $mainMod, X , $d logout menu, exec, $scrPath/logoutlaunch.sh

                        binddm = $mainMod, R, $d hold to resize window, resizewindow




                        "; # additional keybindings configuration
          overrideConfig = null;

        };
        monitors = {
          enable = true; # enable monitor configurations
          overrideConfig = "

monitor=,preferred,auto,1
# monitor=eDP-1,preferred, auto,1.5
# monitor=HDMI-A-1, preferred, auto-up,1
# monitor=DP-2, preferred, auto,1,transform, 3

monitor=eDP-1,2560x1600@165.0,0x1080,1.6
monitor=eDP-2,2560x1600@165.0,0x1080,1.6
#monitor=HDMI-A-1, 1920x1080,auto,1, mirror, eDP-1
monitor=DP-2,1920x1080@75.0,0x0,1.0
monitor=DP-3,1920x1080@75.0,0x0,1.0
monitor=HDMI-A-1,1920x1080@75.0,1925x0,1.0
#monitor=DP-2,transform,3
                        "; # complete monitor configuration override (null or lib.types.lines)
        };
      };

    };
  };

  # Visit https://github.com/richen604/hydenix/blob/main/docs/options.md for more options
}
