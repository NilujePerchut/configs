{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {

  myHomeManager.firefox.enable = true;

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
