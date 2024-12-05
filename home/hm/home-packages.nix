{
  pkgs,
  lib,
  themes,
}:

# Takes hyde theme packages and returns the home-manager packages 
let
  genThemePackages = import ./gen-theme-packages.nix { inherit pkgs lib; };

  themepackages = genThemePackages themes;

in
themepackages
