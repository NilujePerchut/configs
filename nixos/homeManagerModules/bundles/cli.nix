{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
      starship
      silver-searcher
      zellij
      killall
      ripgrep
      dust
 ];

  # Starship
  home.file.".config/starship.toml".source = ../../../zsh/starship.toml;

  # zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    initExtra = "source /home/niluje/configs/zsh/.zshrc\n";
  };

  home.sessionVariables = {
    USING_NIXOS="yes";
  };

  # Kitty stuff
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ../../../kitty.conf;
  };
}
