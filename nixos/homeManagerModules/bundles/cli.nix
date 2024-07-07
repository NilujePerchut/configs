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
      lxqt.qterminal
      kitty
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
    font.size = 12;
    font.name = "NotoMono Nerd Font";
    extraConfig = "enable_audio_bell false\n";
  };

}
