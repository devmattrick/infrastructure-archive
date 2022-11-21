{ pkgs, ... }: {
  config = {
    home.packages = with pkgs; [
      gnomeExtensions.appindicator
      gnomeExtensions.dash-to-panel
      gnomeExtensions.no-overview
    ];

    gtk.theme.name = "Adwaita-dark";

    # A bunch of config changes to make GNOME bearable
    dconf.settings = {
      # Enable GNOME extensions
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          "appindicatorsupport@rgcjonas.gmail.com"
          "dash-to-panel@jderose9.github.com"
          "no-overview@fthx"
        ];
      };

      # Disable activities hot corner
      "org/gnome/desktop/interface" = {
        enable-hot-corners = false;
      };

      # Use the window switcher on Alt-Tab instead of application switcher (why is this not the default??)
      "org/gnome/desktop/wm/keybindings" = {
        switch-applications = [ ];
        switch-applications-backward = [ ];
        switch-windows = [ "<Alt>Tab" ];
        switch-windows-backward = [ "<Shift><Alt>Tab" ];
      };

      # Show both icons and window in window switcher
      "org/gnome/shell/window-switcher" = {
        app-icon-mode = "both";
      };

      # Dash to Panel configuration options
      "org/gnome/shell/extensions/dash-to-panel" = {
        animate-appicon-hover-animation-extent = "{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";
        appicon-margin = 4;
        appicon-padding = 8;
        dot-color-dominant = true;
        dot-size = 4;
        dot-style-focused = "DOTS";
        dot-style-unfocues = "DOTS";
        group-apps = true;
        hotkeys-overlay-combo = "TEMPORARILY";
        window-preview-title-position = "TOP";
      };

      # Show hidden files in the GTK file picker
      "org/gtk/gtk4/Settings/FileChooser" = {
        show-hidden = true;
      };
    };
  };
}
