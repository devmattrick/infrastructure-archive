{config, ...}: {
  imports = [
    ./modules/chromium.nix
    ./modules/cups.nix
    ./modules/discord.nix
    ./modules/firefox.nix
    ./modules/git.nix
    ./modules/gnome.nix
    ./modules/htop.nix
    ./modules/spotify.nix
    ./modules/telegram.nix
    ./modules/vlc.nix
    ./modules/xterm.nix
  ];

  config = {
    # Allow Bluetooth devices to control audio playback
    services.mpris-proxy.enable = true;

    # I prefer lowercase directory names, so change XDG directories to use them
    xdg.userDirs = {
      enable = true;

      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      publicShare = "${config.home.homeDirectory}/public";
      templates = "${config.home.homeDirectory}/templates";
      videos = "${config.home.homeDirectory}/videos";

      # Also have a projects directory for my projects
      extraConfig = {
        XDG_PROJECTS_DIR = "${config.home.homeDirectory}/projects";
      };
    };
  };
}
