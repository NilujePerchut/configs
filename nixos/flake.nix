{
  description = "my_flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      osdegirouette = lib.nixosSystem {
        system = system;
        modules = [ ./configuration.nix nixos-hardware.nixosModules.lenovo-thinkpad-x230 ];
      };
    };
    homeConfigurations = {
      niluje = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
    packages = {
      default = self.packages.${system}.install;

      ${system}.install = pkgs.writeShellApplication {
        name = "install";
        runtimeInputs = with pkgs; [ git ];
        text = ''${./install_nix.sh} "$@"'';
      };
    };
    apps = {
      default = self.apps.${system}.install;
      install = {
          type = "app";
          program = "${self.packages.${system}.install}/bin/install";
      };
    };
  };
}
