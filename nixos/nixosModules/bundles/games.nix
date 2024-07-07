{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    steam
    protonup
    heroic
    bottles
  ];

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PARTS = "/home/user/niluje/.steam/root/compatibilitytoolss";
  };
}
