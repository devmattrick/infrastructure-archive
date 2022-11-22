{ pkgs, ... }: {
  imports = [
    ./modules/home-manager.nix
    ./modules/htop.nix
    ./modules/micro.nix
  ];

  config = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "22.05";

    nixpkgs.config.allowUnfree = true;

    # Use zsh as the default user shell
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    # Enable zsh shell completion for system packages
    environment.pathsToLink = [ "/share/zsh" ];

    # Create users
    users.users.matt = {
      isNormalUser = true;

      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };
}
