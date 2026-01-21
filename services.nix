
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
            {

  services = {
    desktopManager.plasma6.enable = true;
    teamviewer.enable = true;
      asusd.enable=true;
      xserver = {
      enable = true;
         videoDrivers = [ "nvidia" "amdgpu" ];


      };   
        supergfxd.enable = true;

    libinput.enable = true;
    blueman.enable = true;
    upower.enable = true;

    pulseaudio.enable = false;
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
          enable = false;
          # compositor = "kwin";
        };
            
        # package = pkgs.libsForQt5.sddm;
        extraPackages = with pkgs; [
        kdePackages.sddm
                    kdePackages.qtmultimedia
                    kdePackages.sddm-kcm
                    kdePackages.sddm

         sddm-astronaut
        ];
         theme = "sddm-astronaut-theme";
        # theme = "Candy";
        # settings = {
        #   General = {
        #     GreeterEnvironment = "QT_WAYLAND_SHELL_INTEGRATION=layer-shell";
        #   };
        #   Theme = {
        #     CursorTheme = "bibata-cursors";
        #   };
        # };
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
  };
}
