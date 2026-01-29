{ pkgs, inputs, ... }:
{

  environment.systemPackages = with pkgs; [
    inputs.nixvim
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
    zoom-us
    kdePackages.kpmcore
  ];
  programs = {

    kdeconnect.enable = true;
    rog-control-center.enable = true;
    dconf.enable = true;
    # polkit-kde-agent.enable = true;
  };
}
#   environment.systemPackages = with pkgs; [
#     rPackages.rtracklayer
#     rPackages.GenomicRanges
#     java-language-server
#
#     flatpak
#     gradle_8
#     xdg-desktop-portal
#     xdg-desktop-portal-hyprland
#
#     R
#         chromium
#     pipx
#     connman
#     nix-ld
#     distrobox
#     iwgtk
#     bun
#     typescript
#     typescript-language-server
#     javascript-typescript-langserver
#     nodejs
#     htop
#     sddm-astronaut
#         kdePackages.kirigami
#         kdePackages.sddm
#           kdePackages.knewstuff
#
#         sddm-sugar-dark
#         kdePackages.sddm-kcm
# kdePackages.sddm
#    glfw
#    xcb-util-cursor
#     neovim
#     zip
#     android-tools
#     protonvpn-gui
#     unzip
#     flutter
#     wine
#     steam-run
#     gnome-disk-utility
#
#     zig
#     kanata
#     python313Packages.pyqt6
#     kdePackages.qt5compat
#         # kdePackages.qt6ct
#         libsForQt5.qt5ct
#         libsForQt5.qt5.qtsvg
#
#     qt6.qtbase
#       qt6.qtwayland
#   qt6.qtsvg
#   libxcb
#   xorg.libXcursor
#   xorg.libXrandr
#   xorg.libXinerama
#     egl-wayland
#     onlyoffice-desktopeditors
#     lutris
#     rar
#     matlab-language-server
#
#         openvpn
#         valgrind
#       vlc
#       blast
#       gdb
#       cpplint
#       powertop
#     podman
#     brave
#     docker
#     tmux
#     git
#     #apps
#     kitty
#     discord
#     vivaldi
#     firefox
#     obsidian
#     teams-for-linux
#     thunderbird
#     gparted
#     steam
#     waybar
#     yazi
#     alsa-utils
#     kdePackages.okular
#     kdePackages.systemsettings
#     wl-clipboard
# hyprland
#     xwayland
#     wofi
#     # qt5.qtwayland
#     #     kdePackages.qtmultimedia
#     # qt6.qmake
#     # qt6.qtwayland
#     pay-respects
#     pulseaudio
#         pulsemixer
#
#     # home-manager
#     libreoffice
#     asusctl
#     pavucontrol
#     libgcc
#     gcc
#     jdk
#     ags
#     python313
#     # openssl_1_1
#     zstd
#     python312Packages.zstd
#     python313Packages.pybigwig
#       python313Packages.opencv-python
#       # python313Packages.pyqt6
#       # python313Packages.pyqt6-sip
#       # python313Packages.pyqt6-charts
#       # python313Packages.pyqt6-webengine
#       python313Packages.seaborn
#       python313Packages.requests
#       python313Packages.simpleaudio
#       python313Packages.tornado
#       python313Packages.types-beautifulsoup4
#       python313Packages.qrcode
#       python313Packages.pyinstaller
#
#
#       # qt6.full
#       xorg.libXcursor
#       xorg.libX11
#       xorg.libxcb
#       libGL
#       libxkbcommon
#       libdrm
#       libglvnd
#
#     gnumake
#
#     gh
#
#     gtk4
#     gsettings-desktop-schemas
#
#     glib
#     glibc
#     boost
#     libxml2
#     libglibutil
#     samtools
#     wget
#     intltool
#     libpng
#     mariadb
#
#     connmanFull
#
#     # connman-gtk
#     networkmanagerapplet
#     networkmanager_dmenu
#     kdePackages.plasma-nm
#     kdePackages.networkmanager-qt
#
#     lshw
#     lshw-gui
#
#     conda
#    gimp
#       nvtopPackages.nvidia
#     fish
#     zsh
#     perl
#     zlib
#
#     xorg.libSM
#     xorg.libICE
#     xorg.libXrender
#     libselinux
#    man-pages
#       man-pages-posix
#
#     libxcrypt
#     # libxcrypt-legacy
#   ];
