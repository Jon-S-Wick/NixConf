{ pkgs, lib }:
themes:
lib.mkMerge (
  (map (theme: {
    ".config/hyde/themes/${theme.name}" = {
      source = "${theme.pkg}/share/hyde/themes/${theme.name}";
      force = true;
      recursive = true;
      mutable = true;
    };
  }) themes)
)
