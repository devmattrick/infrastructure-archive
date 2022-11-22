{ pkgs, ... }: {
  config = {
    # Hide btop from launcher
    xdg.desktopEntries.btop = {
      name = "btop";
      # exec is required, but we're hiding it anyway so it's okay
      exec = "";
      noDisplay = true;
    };
  };
}
