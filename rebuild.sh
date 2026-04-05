%%bah

# nixos-rebuild switch -I nixos-config=/home/jonwick/nixos/configuration.nix --upgrade --show-trace
nixos-rebuild switch --flake .#jonwick --upgrade --option cores 3 --option max-jobs 6
