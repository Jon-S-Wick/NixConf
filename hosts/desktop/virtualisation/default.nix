{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ "jonwick" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
