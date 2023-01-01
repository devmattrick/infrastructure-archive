{
  pkgs,
  home-manager,
  ...
}: {
  imports = [
    ./modules/git.nix
    ./modules/micro.nix
    ./modules/zsh.nix
  ];

  config = {
    home = {
      stateVersion = "22.11";

      username = "matt";
      homeDirectory = "/home/matt";
    };
  };
}
