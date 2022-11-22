{ pkgs, ... }: {
  config = {
    # Hide XTerm from launcher
    xdg.desktopEntries.xterm = {
      name = "XTerm";
      # exec is required, but we're hiding it anyway so it's okay
      exec = "";
      noDisplay = true;
    };
  };
}
