{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Daniil Oberlev";
    userEmail = "denioberlev@gmail.com";

    aliases = {
      co = "checkout";
      s = "status";
      cl = "clear";
      cm = "commit -m";
      ca = "commit --amend";

      resent = "branch --sort=-commiterdate --format='%(refname:short)'";
    };

    lfs.enable = true;
  
    extraConfig = {
      init.defaultBranch = "main";
      branch.sort = "-committerdate";      

      color.ui = "auto";
      color.status = {
        added = "green";
        changed = "yellow";
        untracked = "red";
      };

      safe = {
        directory = "/etc/nixos";
      };
    };
  };
}
