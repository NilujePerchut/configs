#!/usr/bin/env bash

# Auto install script for nixos system
# 1) install a fresh, no-wm nixos system
# 2) setup wifi using: nmcli device wifi connect <SSID> password <password>
# 3) git clone the repos
# 4) Launch this script
# 5) Wait ...... and enjoy

hostname="$1"
printf "Entering install script for %s\n" "$hostname"

# Automated script to install my config for nixos
# This is not suited for other OS
if  grep ID=nixos /etc/os-release ; then
	echo NixOs Detected
else
	echo NixOs not detected. Exiting
	exit
fi

# Rebuild system
echo About to rebuild system
sudo nixos-rebuild switch --flake ~/configs/nixos#${hostname};

# Install and build home-manager configuration
echo About to install home-manager and stuff
nix-shell -p home-manager --command "home-manager switch --flake ~/configs/nixos#niluje";

# Install hyprland config
cd ~/configs && make hyprland

# Install emacs
cd ~/configs && make doom_emacs
