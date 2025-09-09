{ pkgs, ...}:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./config/gui
    ./config/development
  ];

  home.username = "chouqe";
  home.homeDirectory = "/home/chouqe";

  home.stateVersion = "25.05";
}
