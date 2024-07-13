{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  services.blueman.enable = true;

  # List of minimal packages
  environment.systemPackages = with pkgs; [
    blueman
  ];
}
