{
  inputs,
  outputs,
  pkgs,
  lib,
  ...
}: {
  home = {
    username = "niluje";
    homeDirectory = "/home/niluje";
    stateVersion = "26.05";
  };

  myHomeManager = {
    bundles.default.enable = true;
    bundles.nvim.enable = true;
    bundles.tmux.enable = true;
    bundles.cli.enable = true;
  };
}
