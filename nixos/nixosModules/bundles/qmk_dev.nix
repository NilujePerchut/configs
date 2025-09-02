{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {

  services.udev = {
    extraRules = ''
      # Rules for keyboard web flashing and live training
      KERNEL=="hidraw*", ATTRS{idVendor}=="16c0", MODE="0664", GROUP="plugdev"
      KERNEL=="hidraw*", ATTRS{idVendor}=="3297", MODE="0664", GROUP="plugdev"
    '';

    packages = with pkgs; [
      via
    ];
  };

  environment.systemPackages = with pkgs; [
    qmk
    gcc-arm-embedded
  ];
}
