{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.niluje = {
    isNormalUser = true;
    description = "niluje";
    extraGroups = [ "networkmanager" "wheel" "plugdev" ];
    packages = with pkgs; [
      zsh
    ];
  };
}
