{ pkgs, inputs, ... }:
{

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.lilex
    nerd-fonts.tinos

  ];
  environment.systemPackages = with pkgs; [
    gparted-full
    bitwarden-cli
    libglut
    kdePackages.kmail
    kdePackages.kontact
    kdePackages.mailcommon
    kdePackages.kmail-account-wizard
    kdePackages.mbox-importer
    kdePackages.mailimporter
    kdePackages.akonadi-import-wizard

    steam
    dpkg
    nix-ld
    wine64
    winetricks
    wine-wayland
    libgccjit
    home-manager
    alsa-ucm-conf
    alsa-utils
    helvum
    qpwgraph
    pipewire
    wireplumber

    btop
    btop-cuda
    nvtopPackages.full
    hyprland
    wget
    git
    blast

    inputs.nixvim
    pavucontrol

    efibootmgr
    htop
    racket
    zip
    gzip
    rar
    powertop
    thunderbird
    yazi
    gh
    gimp
    conda
    man-pages-posix
    adbtuifm
    usbutils
    zip
    unzip
    networkmanager-openconnect
    gcc
    gcc-unwrapped
    python312Packages.pyqt6
    glibc
    iwd

    gpclient
    gtk3
    adwaita-icon-theme
    fiji
    qbittorrent
    chromium

    python312Packages.zstd
    python313Packages.pybigwig
    python313
    python313Packages.opencv-python
    python313Packages.seaborn
    python313
    python313Packages.requests
    python313Packages.simpleaudio
    python313Packages.tornado
    python313Packages.types-beautifulsoup4
    python313Packages.qrcode
    python313Packages.pyinstaller
    python313Packages.matplotlib
    zoom-us
    kdePackages.kpmcore
    libinput-gestures # actions touchpad gestures using libinput
    libinput # libinput library
    lm_sensors # system sensors
    pciutils # pci utils
    kdePackages.kpmcore
    nextdns

  ];
  programs = {

    kdeconnect.enable = true;
    rog-control-center.enable = true;
    dconf.enable = true;
    xwayland.enable = true;
    virt-manager.enable = true;
    partition-manager.enable = true;
    # polkit-kde-agent.enable = true;
  };
}
