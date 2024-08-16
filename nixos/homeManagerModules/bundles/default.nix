{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Git settings must always be installed
  programs.git.userName = "niluje";
  programs.git.userEmail = "debarge.cedric@gmail.com";

}
