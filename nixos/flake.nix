{
  # Stolen from vimjoyer's awesome config
  # https://github.com/vimjoyer/nixconf
  description = "Niluje's Flakes";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {...} @ inputs: let
    myLib = import ./myLib/default.nix {inherit inputs;};
  in
    with myLib; {
      nixosConfigurations = {
        # ===================== NixOS Configurations ===================== #
        osdegirouette = mkSystem ./hosts/osdegirouette/configuration.nix;
        osdepoulet = mkSystem ./hosts/osdepoulet/configuration.nix;
      };

      homeConfigurations = {
        # ================ Home configurations ================ #
        "niluje@osdegirouette" = mkHome "x86_64-linux" ./hosts/osdegirouette/home.nix;
        "niluje@osdepoulet" = mkHome "x86_64-linux" ./hosts/osdepoulet/home.nix;
      };

      homeManagerModules.default = ./homeManagerModules;
      nixosModules.default = ./nixosModules;
    };
}
