# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{

  imports = [
    # inputs.hydenix.inputs.home-manager.nixosModules.home-manager
    # inputs.hydenix.nixosModules.default
    # ./modules/system # Your custom system modules
    # inputs.nixos-hardware.nixosModules.common-gpu-nvidia # NVIDIA
    inputs.nixos-hardware.nixosModules.common-cpu-intel # Intel CPUs

    inputs.nixos-hardware.nixosModules.common-pc-laptop # Laptops
    inputs.nixos-hardware.nixosModules.common-pc-ssd # SSD storage
    inputs.minegrub-theme.nixosModules.default
    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix
    # ./nixld.nix

    # ./themes/stylix/pinky.nix
    ./services.nix
    ./pkgs.nix
    # ./var.nix

  ];
  # Bootloader.
  nixpkgs.config.allowUnfree = true;

  boot = {
    loader = {
      systemd-boot.enable = false;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.

      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;

        # copyKernels = false;
        # device = "/dev/nvme0n1p1";

        minegrub-theme = {
          enable = true;
          splash = "100% Flakes!";
          background = "background_options/1.8  - [Classic Minecraft].png";
          boot-options-count = 4;
        };
      };
    };
    #       consoleLogLevel = 3;
    #
    kernelPackages = pkgs.linuxPackages_zen;
    #   initrd = {
    #     kernelModules = [ "nvidia" ];
    #   };
    kernelModules = [
      "nvidia"
      # "asus_wmi"
    ];
    kernelParams = [
      "nvidia-drm.modeset=1"
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      "nvidia.NVreg_TemporaryFilePath=/var/tmp"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "vt.global_cursor_default=0"
      "nvidia.NVreg_RegistryDwords=EnableMSI=0"
      "nouveau.modeset=0"
      "mem_sleep_default=deep"
    ];
    #   # extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    # loader.systemd-boot.enable = true;
    # loader.efi.canTouchEfiVariables = true;
    plymouth = {
      enable = true;
      theme = "lone";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "lone" ];
        })
      ];
    };
  };

  #  swapDevices = [ {
  #     device = "/var/lib/swapfile";
  #     size = 32*1024;
  #   } ];
  # zramSwap = {
  #   enable = true;
  #   algorithm = "lz4"; # You can choose other algorithms like zstd if preferred
  #   memoryPercent = 10; # Adjust this based on your RAM size
  # };
  #
  powerManagement.enable = true;
  hardware = {
    enableRedistributableFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    pulseaudio.enable = false;
    pulseaudio.extraConfig = "unload-module module-suspend-on-idle";

    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      prime = {
        offload.enable = true;
        # enableoOffloadCmd = true;
        amdgpuBusId = "PCI:64:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };

      dynamicBoost.enable = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
  #

  security = {
    rtkit.enable = true; # Enable RealtimeKit for audio purposes
    polkit.enable = true;

  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  systemd = {
    services.docker = {
      after = [ "network.target" ];
      wants = [ "network.target" ];
    };
    network.wait-online.enable = false;

    services.kanata-misc = {
      wantedBy = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking = {
    hostName = lib.mkForce "nixos"; # Define your hostname.

    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openconnect
      ];

    };
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  # networking.networkmanager.enable = true;
  # networking.wireless.iwd.enable = true;
  # networking.networkmanager.dns = "none";
  #   networking.useDHCP = false;
  # networking.dhcpcd.enable = false;
  #
  # networking.networkmanager.wifi.powersave = true;

  #
  # networking.networkmanager.wifi.backend = "iwd";
  # networking.wireless.iwd.enable = true;
  # networking.wireless.iwd.settings = {
  #   IPv6 = { Enabled = true; };
  #   Settings = { AutoConnect = true; };
  # };
  # services.connman.wifi.backend = "iwd";
  # services.gnome.gnome-keyring.enable = true;
  #
  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  #
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  #   #videoDrivers = ["nvidia"];
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  #
  users.users.jonwick = {
    isNormalUser = true;
    description = "Jon Wick";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
      "libvirtd"
      "kvm"
    ];
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "gtk"
        "hyprland"
      ];
    };

    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [ pkgs.gsettings-desktop-schemas ];
  };
  #   # nixpkgs.config.allowUnfree = true;
  #
  environment = {
    #
    #     variables = {
    #
    #         LD_LIBRARY_PATH = "${pkgs.gcc}/lib:/nix/store/kvrhj41ziwxpaz10fql4xypqzvfq3yp7-system-path/lib:$LD_LIBRARY_PATH";
    #         };

    sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      T_QPA_PLATFORM = "wayland";
      GDK_BACKEND = "wayland";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };

  # nixpkgs.config.permittedInsecurePackages = [ "openssl-1.1.1w" ];

  # virtualisation.vmware.host.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # programs.dconf.enable = true;
  #   programs.xwayland.enable = true;
  #   programs.hyprland.xwayland.enable = true;
  #
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  #
  #
  #
  #
  #   systemd = {
  #     network.wait-online.enable = false;
  #     services = {
  #         kanata = {
  #       description = "Kanata Keyboard Remapper";
  #       wantedBy = [ "multi-user.target" ];
  #       after = [ "local-fs.target" ];
  #       serviceConfig = {
  #         ExecStart = "${pkgs.kanata} --cfg /home/jonwick/.k";
  #         Restart = "always";
  #         Type = "simple";
  #         StandardOutput = "journal";
  #         StandardError = "journal";
  #         # Optional:
  #         # Device access may cause delays
  #         # consider adding UDev rules instead of directly accessing input
  #       };
  #     };
  #   };
  # armory-crate = {
  #         description = "Asus crate on startup";
  #
  #   wantedBy = [ "multi-user.target" ];
  #   after = [ "local-fs.target" ];
  #   serviceConfig = {
  #     ExecStart = "${pkgs.rog}";
  #     Restart = "always";
  #     Type = "simple";
  #     StandardOutput = "journal";
  #     StandardError = "journal";
  #     # Optional:
  #     # Device access may cause delays
  #     # consider adding UDev rules instead of directly accessing input
  #   };
  # };
  #
  #   thunderbird = {
  #      description = "Thunderbird background init";
  #      script = "thunderbird --headless";
  # after = [ "local-fs.target" ];
  # serviceConfig = {
  #   Restart = "always";
  #   Type = "simple";
  #   StandardOutput = "journal";
  #   StandardError = "journal";
  #   # Optional:
  #   # Device access may cause delays
  #   # consider adding UDev rules instead of directly accessing input
  # };
  #   };
  #   teams = {
  #      description = "Teams headless";
  #      script = "teams-for-linux --minimized true  ";
  # after = [ "local-fs.target" ];
  # serviceConfig = {
  #   Restart = "always";
  #   Type = "simple";
  #   StandardOutput = "journal";
  #   StandardError = "journal";
  #   # Optional:
  #   # Device access may cause delays
  #   # consider adding UDev rules instead of directly accessing input
  # };

  # };
  # };

  home-manager = {

    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
  };

  # home-manager.users.jonwick = inputs.customHome.homeConfigurations."jonwick";

  # programs.conda.package = pkgs.conda.override {
  #   extraLibraries = pkgs:  ++ extraPackages;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
