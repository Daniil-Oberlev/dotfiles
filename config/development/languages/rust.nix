{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rustc
    cargo
    rustfmt

    # linting
    rust-analyzer
    clippy

    # cargo
    cargo-edit
    cargo-watch
  ];
}
