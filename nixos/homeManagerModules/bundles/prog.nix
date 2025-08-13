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
    python3Full
    gcc
    gnumake
    cmake
    devenv
    qmk
  ];
}
