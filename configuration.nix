{ config, pkgs, ... }:

{
  imports =
    [
      <home-manager/nixos>

      ./hardware-configuration.nix
    ];

  # Home manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.chouqe = import ./home.nix;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  # i18n
  i18n.defaultLocale = "ru_RU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  services.xserver.enable = true;

  # gnome
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.chouqe = {
    isNormalUser = true;
    description = "chouqe";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };


  environment.systemPackages = with pkgs; [
    fastfetch
    home-manager
    tree
    llvmPackages_21.libcxxClang
    linuxHeaders
    docker
  ];

  systemd.services.docker = {
    enable = true;
    description = "Docker Daemon";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.docker}/bin/dockerd";
      Restart = "always";
      ExecStartPre = "${pkgs.docker}/bin/dockerd --check-config";
    };
    wantedBy = [ "multi-user.target" ];
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "code"
      "vscode-fhs"
      "vscode"
     ];

  system.stateVersion = "25.05";
}
