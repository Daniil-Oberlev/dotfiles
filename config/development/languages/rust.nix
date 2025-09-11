{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    docker_28
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
