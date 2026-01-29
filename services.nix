{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  astronautPatched = pkgs.sddm-astronaut.overrideAttrs (old: {
    postInstall = (old.postInstall or "") + ''
      substituteInPlace $out/share/sddm/themes/sddm-astronaut-theme/metadata.desktop \
        --replace "Themes/astronaut.conf" "Themes/pixel_sakura.conf"
    '';
  });
in
{
  environment.systemPackages = with pkgs; [
    astronautPatched
  ];

  services = {
    thermald.enable = true;
    power-profiles-daemon.enable = lib.mkForce false;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 90;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

      };
    };
    desktopManager.plasma6.enable = true;
    teamviewer.enable = true;
    asusd.enable = true;
    xserver = {
      enable = true;
      videoDrivers = [
        "nvidia"
        "amdgpu"
      ];

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
      jack.enable = false;
    };

    dbus = {

      enable = true;
      packages = [ pkgs.kdePackages.kpmcore ];
    };
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
          # compositor = "kwin";
        };

        # package = pkgs.libsForQt5.sddm;
        extraPackages = with pkgs; [
          kdePackages.sddm
          kdePackages.qtmultimedia
          kdePackages.sddm-kcm
          kdePackages.sddm

          astronautPatched
        ];
        theme = "sddm-astronaut-theme";
        settings = {
          Theme = {
            # Current = "Sakura";
            CurrentPreset = "Sakura";
          };
        };
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
  #Remove radeon from also settings
  #     environment.etc."wireplumber/main.lua.d/60-disable-radeon-hda.lua".text = ''
  #   rule = {
  #     matches = {
  #       {
  #         { "device.name", "matches", "alsa_card.pci-0000_*_hda_radeon*" },
  #       },
  #     },
  #     apply_properties = {
  #       ["device.disabled"] = true,
  #     },
  #   }
  #
  #   table.insert(default_rules, rule)
  # '';

}
