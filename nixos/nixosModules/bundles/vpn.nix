{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  # Needed for wireguard
  networking.firewall.checkReversePath = false;
}
