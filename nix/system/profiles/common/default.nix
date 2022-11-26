{ pkgs, ... }: {
  imports = [
    ./modules/git.nix
    ./modules/htop.nix
    ./modules/home-manager.nix
    ./modules/ldns.nix
    ./modules/micro.nix
  ];

  config = {
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    system.stateVersion = "22.05";

    nixpkgs.config.allowUnfree = true;

    networking.domain = "lab.mattrick.org";

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
