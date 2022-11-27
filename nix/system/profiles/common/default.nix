{pkgs, ...}: {
  imports = [
    ./modules/git.nix
    ./modules/htop.nix
    ./modules/home-manager.nix
    ./modules/ldns.nix
    ./modules/micro.nix
    ./modules/users.nix
  ];

  config = {
    nix.settings = {
      experimental-features = ["nix-command" "flakes"];
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
    environment.pathsToLink = ["/share/zsh"];

    # Create users
    users.users.matt = {
      isNormalUser = true;

      extraGroups = [
        "wheel"
        "networkmanager"
      ];

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBJ7plqu/62IIaNdHf4QWn8zFM5sJAP0peftiheVOhI5"
      ];
    };
  };
}
