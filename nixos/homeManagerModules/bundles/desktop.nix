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
    wezterm
    brave
    emacs-gtk
    gimp
    onlyoffice-bin
    vlc
    putty
    meld
  ];
}
