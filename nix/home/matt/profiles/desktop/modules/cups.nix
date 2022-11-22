{ pkgs, ... }: {
  config = {
    # Hide CUPS "Manage Printing" from launcher
    xdg.desktopEntries.cups = {
      name = "Manage Printing";
      # exec is required, but we're hiding it anyway so it's okay
      exec = "";
      noDisplay = true;
    };
  };
}
