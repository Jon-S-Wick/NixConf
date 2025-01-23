# Nixvim is a NixOS module that installs and configures Neovim
{ inputs, ... }: {
  # let
  #   nixvim = import (builtins.fetchGit {
  #         url = "https://github.com/nix-community/nixvim";
  #         # When using a different channel you can use `ref = "nixos-<version>"` to set it here
  #                 inputs.nixpkgs.follows = "nixpkgs";
  #     });
  # in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/cmp.nix
    # ./plugins/dashboard.nix
    ./plugins/lsp.nix
    ./plugins/markdown.nix
    ./plugins/tree.nix
    ./plugins/ui.nix
    ./plugins/utils.nix
    ./plugins/dap.nix
    ./plugins/telescope.nix
    ./plugins/zenmode.nix

    ./options.nix
    ./keymaps.nix
  ];
  # plugins.nixvim.enable = true;
  # nixvim.enable = true;
  programs.nixvim = {
    enable = true;
    # colorschemes.kanagawa.enable = true;
    colorschemes.catppuccin.enable = true;

  };
}
