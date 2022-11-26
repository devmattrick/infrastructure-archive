{
  lib,
  pkgs,
  ...
}: {
  config = {
    # Unfortunately, home-manager (understandably) doesn't have a module for Steam, so install globally
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };

    # Allow unfree Steam packages
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "steam"
        "steam-original"
        "steam-runtime"
      ];
  };
}
