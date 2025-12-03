{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    rustup
    tig
    gcc
    gnumake
    cmake
    devenv
  ];
}
