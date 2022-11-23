{ pkgs, ... }: {
  config = {
    # Hide htop from launcher
    xdg.desktopEntries.htop = {
      name = "htop";
      # exec is required, but we're hiding it anyway so it's okay
      exec = "";
      noDisplay = true;
    };
  };
}
