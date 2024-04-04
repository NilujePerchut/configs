#!/usr/bin/env bash

# Auto install script for nixos system
# 1) install a fresh, no-wm nixos system
# 2) setup wifi using: nmcli device wifi connect <SSID> password <password>
# 3) install as user (not root):
#    nix-shell -p git --command "nix run --experimental-features 'nix-command flakes' github:NilujePerchut/configs/nixos?dir=nixos#apps.install"
# 4) Wait ...... and enjoy

# TODO:
#	[ ] pass hostname as parameter (or auto detect)
#	[ ] find a way to allow to gitignore of hardware-config.nix without making nix complain about not found file

echo Entering install script

# Automated script to install my config for nixos
# This is not suited for other OS
if  grep ID=nixos /etc/os-release ; then
	echo NixOs Detected
else
	echo NixOs not detected. Exiting
	exit
fi

# Clone dotfiles
nix-shell -p git --command "git clone --branch nixos https://github.com/NilujePerchut/configs ~/configs"

# Generate hardware config for new system
echo About to create harware-config.nix
sudo nixos-generate-config --show-hardware-config > ~/configs/nixos/hardware-configuration.nix

# Rebuild system
echo About to rebuild system
sudo nixos-rebuild switch --flake ~/configs/nixos#osdegirouette;

# Install and build home-manager configuration
echo About to install home-manager and stuff
nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/configs/nixos#niluje;

# Install hyprland config
cd ~/configs && make hyprland

# Install emacs
cd ~/configs && make doom_emacs
