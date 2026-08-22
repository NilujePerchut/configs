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
    [
      ./hardware-configuration.nix
      ./filesystems.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  myNixOS = {
    bundles.default.enable = true;
    bundles.users.enable = true;
    bundles.hosts.enable = true;
  };

  networking = {
    hostName = "osdetv";
    networkmanager.enable = true;
    enableIPv6 = false;

    interfaces = {
      eno1 = {
        wakeOnLan.enable = true;
      };
    };
  };

  # Disable firewall since we are behind a VPN
  networking.firewall.enable = false;

  system.stateVersion = "26.05";
}
