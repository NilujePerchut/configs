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
    stateVersion = "24.05";
  };

  myHomeManager = {
    bundles.default.enable = true;
    bundles.print3d.enable = true;
    bundles.nvim.enable = true;
    bundles.cli.enable = true;
    bundles.prog.enable = true;
    bundles.elec.enable = true;
  };
}
