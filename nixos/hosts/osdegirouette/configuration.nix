{
  config,
  pkgs,
  lib,
  inputs,
  outputs,
  system,
  myLib,
  ...
}: {
  imports = [ ./hardware-configuration.nix
              inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x230 ];

  # Bootloader.
  boot = {
    loader.grub.enable = true;
    loader.grub.device = "/dev/sda";
    loader.grub.useOSProber = true;
  };

  myNixOS = {
    bundles.desktop.enable = true;
    bundles.default.enable = true;
    bundles.games.enable = true;
  };

  # Use ZSH
  environment.shells = with pkgs; [ bash zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  networking = {
    hostName = "osdegirouette";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  # Configure console keymap
  console.keyMap = "fr";

  security.pam.services.swaylock = {};

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.dbus = {
    enable = true;
    packages = [ pkgs.dconf ];
  };

  programs.dconf = {
    enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.niluje = {
    isNormalUser = true;
    description = "niluje";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      zsh
    ];
  };

  # Laptop power management stuff
  powerManagement.enable = true;
  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    htop
    tig
  ];

  fonts.packages = with pkgs; [
    #noto-fonts
    (nerdfonts.override { fonts = [ "Noto" "Iosevka"]; })
  ];

  # Make neovim the default editor
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes"];
}
