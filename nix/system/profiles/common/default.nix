{ pkgs, ... }: {
  imports = [
    ./modules/btop.nix
    ./modules/git.nix
    ./modules/home-manager.nix
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
