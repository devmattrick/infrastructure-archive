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
        overlays = [ nur.overlay ];
      };
    in
    {
      nixosConfigurations = {
        "hydrogen" = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./system/hosts/hydrogen.nix
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

      # deploy-rs configuration
      deploy.nodes = {
        sshUser = "matt";
        user = "root";

        # When I add server configs, this will probably only be used for those, but I have this here as a placeholder...
        hydrogen = {
          profiles = {
            system.path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.hydrogen;
            home.path = deploy-rs.lib.x86_64-linux.activate.home-manager self.homeConfigurations."matt@hydrogen";
          };
        };
      };

      checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
