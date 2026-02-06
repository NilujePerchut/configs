{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {

  # Add the plugdev group
  users.groups.plugdev = {};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.niluje = {
    isNormalUser = true;
    description = "niluje";
    extraGroups = [ "networkmanager" "wheel" "plugdev" "dialout"];
    packages = with pkgs; [
      zsh
    ];
  };
}
