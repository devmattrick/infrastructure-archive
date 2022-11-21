{
  description = "NixOS configuration for my systems";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nur, home-manager, deploy-rs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ nur.overlay ];
      };
    in
    {
      nixosConfigurations = {
        "hydrogen" = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./system/hosts/hydrogen
          ];

          specialArgs = inputs;
        };
      };

      homeConfigurations = {
        "matt@hydrogen" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home/matt/hosts/hydrogen.nix
          ];
        };
      };
    };
}
