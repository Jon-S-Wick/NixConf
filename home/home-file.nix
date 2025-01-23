{ lib, config, pkgs, ... }:

lib.mkMerge [{
  ".config/menus" = {
    source = "/menus/application.menu";
    force = true;
    recursive = true;
    mutable = true;
  };
}]
