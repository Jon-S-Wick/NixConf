# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ 
    ./hardware-configuration.nix
      ./hosts/desktop
      ./home/home.nix
    ];

  # Bootloader.

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot = {
   initrd = {
    kernelModules = [ "nvidia"];
   };
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

hardware = {
	#opengl = {
	#	enable = true;
	#	driSupport = true;
	#	driSupport32Bit = true;
	#};


nvidia = {
        modesetting.enable = true;
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
        forceFullCompositionPipeline = true;
        powerManagement.enable = true;
};


};
  services.xserver.videoDrivers = ["nvidia"];

hardware.pulseaudio.enable = false; # Use Pipewire, the modern sound subsystem

  security.rtkit.enable = true; # Enable RealtimeKit for audio purposes

  #sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #
  # Bluetooth
  #
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

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
  services.xserver.xkb = {
    layout = "us";
    variant = "";
    #videoDrivers = ["nvidia"];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jonwick = {
    isNormalUser = true;
    description = "Jon Wick";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };


  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
  #cli tools
neovim
zsh
tmux
git
#apps
kitty
discord
vivaldi
firefox
obsidian
teams-for-linux
thunderbird
gparted
steam
# Hyprland and utils
waybar
yazi
alsa-utils
kdePackages.okular
wl-clipboard
hyprland-protocols
hyprland
xdg-desktop-portal-hyprland
xwayland
wofi
xdg-utils
xdg-desktop-portal-gtk
qt5.qtwayland
qt6.qmake
qt6.qtwayland
xfce.thunar
thefuck

pipewire
pulseaudio

home-manager

asusctl

pavucontrol

#Compilers
libgcc
gcc
jdk
#jdk22
python3
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

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
  system.stateVersion = "24.05"; # Did you read the comment?
}
