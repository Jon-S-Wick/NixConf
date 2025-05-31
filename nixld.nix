{ config, pkgs, ... }:
{
  # Enable nix ld
  programs.nix-ld.enable = true;

  # Sets up all the libraries to load
  programs.nix-ld.libraries = with pkgs; [
    jdk23
    jdt-language-server
    jdk23

    openssl
    libxcrypt
    libxml2
    glib
    glibc
    gmime3
    krb5
    nss
    nspr
    xorg.libX11
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    libgtkflow3
    gtk3
    cairo
    gcc
    libxml2
    pango
    glib
    boost
    atk
    gdk-pixbuf
    webkitgtk
    libsoup
    gdk-pixbuf-xlib
    webp-pixbuf-loader
    xorg.libXrender
    xorg.libXrandr

    stdenv.cc.cc
    zlib
    fuse3
    icu
    openssl
    curl
    expat
    #for openconnect-sso
    libsecret
    krb5
    xorg.libX11
    nspr
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXrender
    x11basic
    # xorg.xlibs
    #for cisco annyconenct
    gcc
    glibc
    libglibutil

    glib
    libxml2
    xorg.libXrandr
    gtk3
    atk
    pango
    gdtoolkit_3
    gdk-pixbuf
    cairo
    xorg.xhost
    libgtkflow3
    webkitgtk
    libsoup
    gdk-pixbuf
    shared-mime-info
    xorg.libXtst
    dbus
    fontconfig
    freetype
    libdrm
    libxkbcommon
    xorg.libxcb
    xorg.libXi
    xorg-autoconf
    alsa-lib
    xorg.libxshmfence
    mesa
    xorg.libxkbfile
    libGL

    # ...
  ];
}
