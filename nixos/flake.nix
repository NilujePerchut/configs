{
  # Stolen from vimjoyer's awesome config
  # https://github.com/vimjoyer/nixconf
  description = "Niluje's Flakes";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {...} @ inputs: let
    myLib = import ./myLib/default.nix {inherit inputs;};
  in
    with myLib; {
      nixosConfigurations = {
        # ===================== NixOS Configurations ===================== #
        osdegirouette = mkSystem ./hosts/osdegirouette/configuration.nix;
        osdepoulet = mkSystem ./hosts/osdepoulet/configuration.nix;
        osdeframboise = mkSystem ./hosts/osdeframboise/configuration.nix;
        osdeplacard = mkSystem ./hosts/osdeplacard/configuration.nix;
      };

      homeConfigurations = {
        # ================ Home configurations ================ #
        "niluje@osdegirouette" = mkHome "x86_64-linux" ./hosts/osdegirouette/home.nix;
        "niluje@osdepoulet" = mkHome "x86_64-linux" ./hosts/osdepoulet/home.nix;
        "niluje@osdeframboise" = mkHome "aarch64-linux" ./hosts/osdeframboise/home.nix;
        "niluje@osdeplacard" = mkHome "x86_64-linux" ./hosts/osdeplacard/home.nix;
      };

      homeManagerModules.default = ./homeManagerModules;
      nixosModules.default = ./nixosModules;
    };
}
