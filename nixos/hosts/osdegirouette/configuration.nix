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
    bundles.users.enable = true;
    bundles.power.enable = true;
    bundles.hosts.enable = true;
    bundles.vpn.enable = true;
  };

  networking = {
    hostName = "osdegirouette";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
