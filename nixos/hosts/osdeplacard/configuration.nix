# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

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
  imports =
    [ ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  myNixOS = {
    bundles.default.enable = true;
    bundles.users.enable = true;
    bundles.hosts.enable = true;
    services.jellyfin.enable = true;
    services.paperless.enable = true;
    services.dashboard.enable = true;
  };

  networking = {
    hostName = "osdeplacard";
    networkmanager.enable = true;
    enableIPv6 = false;
  };

  # Disable firewall since we are behind a VPN
  networking.firewall.enable = false;

  system.stateVersion = "24.05";
}
