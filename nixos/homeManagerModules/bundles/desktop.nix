{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    lxqt.qterminal
    kitty
    brave
    emacs-gtk
    gimp
  ];
}
