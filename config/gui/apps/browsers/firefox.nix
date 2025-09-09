{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.default = {
      settings = {
        "browser.startup.homepage" = "https://google.com";
        "browser.search.defaultenginename" = "Google";
      };
    };
  };
}
