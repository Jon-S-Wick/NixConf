
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:{

  services = {
    desktopManager.plasma6.enable = true;
    teamviewer.enable = true;
      asusd.enable=true;
      xserver = {
         videoDrivers = [ "nvidia" "amdgpu" ];


      };   

    libinput.enable = true;
    blueman.enable = true;

    flatpak.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber.enable = true;
        audio.enable = true;
         # jack.enable = true;
    };

    dbus.enable = true;
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };

    openssh.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland = {
          enable = true;
          compositor = "kwin";
        };
            
         theme = "sddm-astronaut";
        # package = pkgs.libsForQt5.sddm;
        extraPackages = with pkgs; [
          # sddm-sugar-dark
         sddm-astronaut
        #   libsForQt5.qt5.qtquickcontrols # for sddm theme ui elements
        #   libsForQt5.layer-shell-qt # for sddm theme wayland support
        #   libsForQt5.qt5.qtquickcontrols2 # for sddm theme ui elements
        #   libsForQt5.qt5.qtgraphicaleffects # for sddm theme effects
        #   libsForQt5.qtsvg # for sddm theme svg icons
        # libsForQt5.qt5.qtwayland # wayland support for qt5
          # bibata-cursors
          # Bibata-Modern-Ice
        ];
        # theme = "Candy";
        settings = {
          General = {
            GreeterEnvironment = "QT_WAYLAND_SHELL_INTEGRATION=layer-shell";
          };
          Theme = {
            ThemeDir = "/run/current-system/sw/share/sddm/themes/sddm-astronaut-theme";
            CursorTheme = "bibata-cursors";
          };
        };
      };
      sessionPackages = [ pkgs.hyprland ];

    };
  kanata = {
    enable = true;
    keyboards = {
      "misc".config = ''
                  
        (defsrc
          caps
        )

        (defalias
          escctrl  (tap-hold 100 100 esc lmet)

        )

        (deflayer base
          @escctrl
        )
      '';
    };
  };

    upower.enable = true;

  };
}
