{
  description = "NixOS configuration for my systems";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nur,
    home-manager,
    deploy-rs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        nur.overlay
        (import ./overlays)
      ];
    };
  in {
    nixosConfigurations = {
      "hydrogen" = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./system/hosts/hydrogen
        ];

        specialArgs = inputs;
      };

      # "lithium" = nixpkgs.lib.nixosSystem {
      #   inherit system;

      #   modules = [
      #     ./system/hosts/lithium
      #   ];

      #   specialArgs = inputs;
      # };
    };

    homeConfigurations = {
      "matt@hydrogen" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home/matt/hosts/hydrogen.nix
        ];
      };

      # "matt@lithium" = home-manager.lib.homeManagerConfiguration {
      #   inherit pkgs;

      #   modules = [
      #     ./home/matt/hosts/lithium.nix
      #   ];
      # };
    };

    deploy.nodes = {
      # sshUser = "deploy";

      # lithium = {
      #   hostname = "lithium.lab.mattrick.org";

      #   profiles = {
      #     system = {
      #       path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.lithium;
      #     };

      #     home-matt = {
      #       user = "matt";
      #       path = deploy-rs.lib.x86_64-linux.activate.home-manager self.homeConfigurations."matt@lithium";
      #     };
      #   };
      # };
    };

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
  };
}
