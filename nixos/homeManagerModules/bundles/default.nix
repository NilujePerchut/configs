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
  programs.git.settings.user.name = "niluje";
  programs.git.settings.user.email = "debarge.cedric@gmail.com";

}
