{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  # nvim dependancies
  home.packages = with pkgs; [
    gcc
    nodejs
    unzip
    ripgrep
    yarn
    fd
  ];

  # nvim
  home.file = {
    ".config/nvim" = {
      recursive = true;
      source = ../../../nvim;
    };
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
