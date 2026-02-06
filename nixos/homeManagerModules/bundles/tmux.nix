{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  home.file = {
    ".config/tmux" = {
      recursive = true;
      source = ../../../tmux;
    };
  };
}
