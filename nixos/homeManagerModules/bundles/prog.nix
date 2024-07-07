{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  programs.git.userName = "niluje";
  programs.git.userEmail = "debarge.cedric@gmail.com";

  home.packages = with pkgs; [
    rustup
    tig
    python3Full
    gcc
    gnumake
    cmake
  ];
}
