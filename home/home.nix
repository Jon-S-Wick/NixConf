{   pkgs,config, ...}: {

  imports = [

  ../var.nix
  ./programs/kitty
  ./programs/thunar
  ./programs/yazi
  ./programs/nvim
  ./programs/shell
  # ./programs/spicetify
  

  ./system/hypridle
  ./system/hyprpanel
  ./system/hyprland
  ./system/wofi
  ./system/hyprpaper
  ./system/hyprlock
  ./system/clipman
  ./system/tofi
  ./system/udiskie
  



  ./scripts/default.nix
  ./system/gtk
  ./system/zathura

  
   # hyprland.homeManagerModules.default
  #  ./environment
    # ./programs
    # ./packages
 #   ./scripts
#    ./themes
  ];

home = {

    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;
  packages = with pkgs;[

hyprpolkitagent
  ];
  };

  # inputs.nixvim = {
  #   url = "github:nix-community/nixvim";
  #   # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
  #   # url = "github:nix-community/nixvim/nixos-24.11";
  #
  #   inputs.nixpkgs.follows = "nixpkgs";
  # };
  #
  # programs.home-manager.enable = true;

  # homeModules = [];
  # home = {
  #     username = "jonwick";
  #     homeDirectory = "/home/jonwick/";
  #
  #   };
  #
  # home.sessionVariables = import ./hm/home-env.nix {};
  # home.packages = import /

  # home.username = "jonwick";
  # home.homeDirectory = "/home/jonwick";
  #
  #   xdg.portal = {
  #     enable = true;
  #     extraPortals = with pkgs; [
  #       xdg-desktop-portal-gtk
  #     ];
  #     config.common.default = "*";
  #     xdgOpenUsePortal = true;
  #   };

  # home.sessionVariables = import ./hm/home-env.nix;
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";

  # system.stateVersion = "24.05"; # Did you read the comment?
}
