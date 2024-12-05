{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --------------------------------------------------- // Display Manager
    wayland # for wayland support
    egl-wayland # for wayland support
    xwayland # for x11 support
  ];
}
