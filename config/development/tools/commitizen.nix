{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    cz-cli
  ];
}
