{ pkgs, lib, ... }:
themes:

let
  arcStore = import ../sources/themes/utils/arcStore.nix { inherit pkgs; };

  # Default packages to use when theme doesn't specify them
  defaultArcs = {
    icon = arcStore.icon."Tela-circle-dracula";
    cursor = arcStore.cursor."Bibata-Modern-Ice";
  };

  # Generate packages list for a single theme
  mkThemePackages =
    theme:
    let
      # Get package from an arc if it exists, otherwise use default
      getArcPkg =
        arcName:
        let
          arc = theme.arcs.${arcName} or null;
          defaultPkg = defaultArcs.${arcName} or null;
        in
        if (arc ? pkg && arc.pkg != null) then
          [ arc.pkg ]
        else if defaultPkg != null then
          [ defaultPkg ]
        else
          [ ];
    in
    # Combine base theme package with arc packages
    (if theme ? pkg then [ theme.pkg ] else [ ])
    ++ (lib.concatMap getArcPkg [
      "gtk"
      "icon"
      "cursor"
      "font"
    ]);
in
lib.flatten (lib.filter (x: x != [ ]) (map mkThemePackages themes))
