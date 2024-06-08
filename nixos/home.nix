{ config, pkgs, ... }:

{ # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "niluje";
  home.homeDirectory = "/home/niluje";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    starship
    lxqt.qterminal
    brave

    # nvim needs
    gcc
    nodejs
    unzip
    ripgrep
    yarn
    fd

    # misc
    tig
    silver-searcher
    zellij
    emacs
    killall

    # prog
    rustup
    python3Full
    gcc
    gnumake
    cmake
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/niluje/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    USING_NIXOS="yes";
    EDITOR = "vim";
  };

  # Starship
  home.file.".config/starship.toml".source = ../zsh/starship.toml;

  # nvim
  home.file = {
    ".config/nvim" = {
      recursive = true;
      source = ../nvim;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    initExtra = "source /home/niluje/configs/zsh/.zshrc\n";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
