{ config, lib, pkgs, ... }:

{
  inputs = {
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
  };
  # ...

  outputs = inputs @ {
    home-manager,
    hyprpanel,
    ...
  }: let
    system = "x86_64-linux"; # change to whatever your system should be
  in {
    homeConfigurations."username@host" = home-manager.lib.homeManagerConfiguration {
      pkgs= {
        inherit system;
        overlays = [
          inputs.hyprpanel.overlay
        ];
      };
      extraSpecialArgs = {
        inherit system;
        inherit inputs;
      };
    };
  };
}
