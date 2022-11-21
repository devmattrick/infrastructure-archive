{ ... }: {
  config = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "22.11";

    # Use zsh as the default user shell
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    # Enable zsh shell completion for system packages
    environment.pathsToLink = [ "/share/zsh" ];

    # Create users
    user.users.matt = {
      isNormalUser = true;

      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };
}
