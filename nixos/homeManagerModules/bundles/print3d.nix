{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    openscad
    freecad
    bambu-studio
  ];
}
