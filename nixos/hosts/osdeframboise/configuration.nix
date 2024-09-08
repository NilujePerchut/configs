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
      inputs.nixos-hardware.nixosModules.raspberry-pi-4
    ];

  # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;

  myNixOS = {
    bundles.default.enable = true;
    bundles.users.enable = true;
    bundles.hosts.enable = true;
    services.cockpit.enable = true;
    services.paperless.enable = true;
    services.freshrss.enable = true;
  };

  networking = {
    hostName = "osdeframboise";
    enableIPv6 = false;
  };
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.niluje = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  # Disable firewall since we are behind a VPN
  networking.firewall.enable = false;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.cockpit = {
    enable = true;
    port = 9090;
    settings = {
      WebService = {
        AllowUnencrypted = true;
      };
    };
  };

  environment.etc."paperless-admin-pass".text = "admin";
  services.paperless = {
    enable = true;
    port = 9091;
    address = "0.0.0.0";
    passwordFile = "/etc/paperless-admin-pass";
  };

  environment.etc."freshrss-admin-pass".text = "admin";
  services.freshrss = {
    enable = true;
    passwordFile = "/etc/freshrss-admin-pass";
    baseUrl = "";
    authType = "none";
  };

  system.stateVersion = "23.11";
}
