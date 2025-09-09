{ ... }:

let
  allFiles = builtins.attrNames (builtins.readDir ./.);
  nixFiles = builtins.filter
    (file: 
      (builtins.match ".*\\.nix" file != null) &&
      (file != "default.nix")
    )
    allFiles;
in
{
  imports = map (file: ./. + "/${file}") nixFiles;
}
