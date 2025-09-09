{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs_24

    # package managers
    yarn
    pnpm
  ];
}
