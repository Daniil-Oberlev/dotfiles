{ pkgs, ...}:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./config/git.nix
    ./config/vscode.nix

    ./config/development
  ];

  home.username = "chouqe";
  home.homeDirectory = "/home/chouqe";

  home.stateVersion = "25.05";
}
