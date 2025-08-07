{ pkgs, ...}:

{
  imports = [
    ./config/git.nix
  ];

  home.username = "chouqe";
  home.homeDirectory = "/home/chouqe";

  # Перезагружать службы при изменении home.nix
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
