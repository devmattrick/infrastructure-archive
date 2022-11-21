{ ... }: {
  imports = [
    ./modules/1password.nix
    ./modules/chromium.nix
    ./modules/discord.nix
    ./modules/firefox.nix
    ./modules/gnome.nix
    ./modules/spotify.nix
    ./modules/telegram.nix
    ./modules/vlc.nix
  ];

  config = {
    programs.dconf.enable = true;

    xdg.portal.enable = true;

    services.mpris-proxy.enable = true;
  };
}
