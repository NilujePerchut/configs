{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    brave
    emacs-gtk
    gimp
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
