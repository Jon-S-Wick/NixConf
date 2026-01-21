{pkgs, ... }:

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
			themes = [ "AbyssGreen" "Gruvbox Retro" "Catppuccin Mocha" "Catppuccin Latte"];
		  };
                terminals = {
                    enable = true; # enable terminals module
                    kitty = {
                      enable = true; # enable kitty terminal
                      configText = "window_padding_width 5"; # kitty config text
                    };
                  };
            hyprland = {
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
                        bindd = $mainMod, x , $d logout menu, exec, $scrPath/logoutlaunch.sh




                        "; # additional keybindings configuration
                  overrideConfig = null;

                };
            };

	  };
	};


  # Visit https://github.com/richen604/hydenix/blob/main/docs/options.md for more options
}

