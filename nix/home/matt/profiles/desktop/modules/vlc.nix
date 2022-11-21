{ pkg, ... }: {
  home.packages = with pkg; [ vlc ];
}
