{ pkgs, home-manager, ... }: {
  imports = [
    ./modules/git.nix
    ./modules/micro.nix
    ./modules/zsh.nix
  ];

  config = {
    nixpkgs.config.allowUnfree = true;

    home = {
      stateVersion = "22.05";

      username = "matt";
      homeDirectory = "/home/matt";
    };
  };
}
