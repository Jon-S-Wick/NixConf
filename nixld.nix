{ config, pkgs, ... }:
{
  # Enable nix ld
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    libglut
  ];
}
