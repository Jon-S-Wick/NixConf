{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  nixpkgs.overlays = [
    (self: super: {
      sddm-astronaut = super.sddm-astronaut.override {
        embeddedTheme = "pixel_sakura"; # <- example
      };
    })
  ];
  environment.systemPackages = with pkgs; [ sddm-astronaut ];
  services = {
    # howdy.enable = true;
    linux-enable-ir-emitter.enable = true;
    nextdns.enable = true;
    thermald.enable = true;
    supergfxd.enable = true;
    libinput.enable = true;
    blueman.enable = true;
    upower.enable = true;
    desktopManager.plasma6.enable = true;
    teamviewer.enable = true;
    asusd.enable = true;
    # power-profiles-daemon.enable = false;
    flatpak.enable = true;
    openssh.enable = true;

    tlp = {
      enable = false;
      # settings = {
      #   CPU_SCALING_GOVERNOR_ON_AC = "performance";
      #   CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      #
      #   CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      #   CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      #
      #   CPU_MIN_PERF_ON_AC = 0;
      #   CPU_MAX_PERF_ON_AC = 90;
      #   CPU_MIN_PERF_ON_BAT = 0;
      #   CPU_MAX_PERF_ON_BAT = 15;
      #
      # };
    };
    xserver = {
      enable = true;
      videoDrivers = [
        "nvidia"
        "amdgpu"
      ];

    };

    # pulseaudio.enable = false;
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
      extraConfig.pipewire."10-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 256;
          "default.clock.min-quantum" = 256;
          "default.clock.max-quantum" = 256;
        };
      };
    };

    dbus = {

      enable = true;
      packages = [ pkgs.kdePackages.kpmcore ];
    };
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };

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
          sddm-astronaut

        ];
        theme = "sddm-astronaut-theme";
        settings = {
          Theme = {
            # Current = "Sakura";
            CurrentPreset = "Sakura";
          };
        };
      };
      sessionPackages = [ pkgs.hyprland ];

    };
    kanata = {
      enable = true;
      # systemd.services.kanata-misc = {
      #   wantedBy = [ "graphical-session.target" ];
      #   after = [ "graphical-session.target" ];
      # };

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
  environment.etc."wireplumber/main.lua.d/60-disable-radeon-hda.lua".text = ''
    rule = {
      matches = {
        {
          { "device.name", "matches", "alsa_card.pci-0000_*_hda_radeon*" },
        },
      },
      apply_properties = {
        ["device.disabled"] = true,
      },
    }

    table.insert(default_rules, rule)
  '';

}
