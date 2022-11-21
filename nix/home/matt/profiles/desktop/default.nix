{ ... }: {
  imports = [
    ./modules/chromium.nix
    ./modules/discord.nix
    ./modules/firefox.nix
    ./modules/gnome.nix
    ./modules/spotify.nix
    ./modules/telegram.nix
    ./modules/vlc.nix
  ];

  config = {
    services.mpris-proxy.enable = true;
  };
}
