{ pkgs, ...}:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./config/git.nix
    ./config/vscode.nix
  ];

  home.username = "chouqe";
  home.homeDirectory = "/home/chouqe";

  # Перезагружать службы при изменении home.nix
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
