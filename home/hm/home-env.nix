{
  lib,
}:

{
  # Wayland and general environment
  NIXOS_OZONE_WL = "1"; # Enable Ozone Wayland support for Electron-based apps
  MOZ_ENABLE_WAYLAND = "1"; # Enable Wayland support for Mozilla Firefox
}
