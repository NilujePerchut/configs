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
              inputs.nixos-hardware.nixosModules.framework-13-7040-amd ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  myNixOS = {
    bundles.desktop.enable = true;
    bundles.default.enable = true;
    bundles.games.enable = true;
    bundles.users.enable = true;
    bundles.bluetooth.enable = true;
    bundles.hosts.enable = true;
    bundles.vpn.enable = true;
  };

  networking = {
    hostName = "osdepoulet";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  environment.sessionVariables = rec {
    HYPRLAND_SCALE = "1.333333";
  };

  # BIOS update
  services.fwupd.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
