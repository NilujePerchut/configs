{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    kicad
  ];
}
