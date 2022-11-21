{ pkgs, ... }: {
  config = {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-devedition-bin;

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        onepassword-password-manager
        sponsorblock
      ];

      profiles.default = {
        id = 0;

        name = "Default";

        search = {
          force = true;
          default = "Google";

          engines = {
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "DuckDuckGo".metaData.hidden = true;
            "eBay".metaData.hidden = true;
            "Wikipedia (en)".metaData.hidden = true;
          };

          settings = {
            # Disable "first run" page
            "trailhead.firstrun.didSeeAboutWelcome" = true;

            # Disable Alt key causing toolbar to pop up
            "ui.key.menuAccessKeyFocuses" = false;

            # Disable sponsored stuff
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.urlbar.suggest.quicksuggest.sponsored" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

            # Disable telemetry stuff
            "app.shield.optoutstudies.enabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.pioneer-new-studies-available" = false;
            "toolkit.telemetry.coverage.opt-out" = true;
            "experiments.enabled" = false;
            "network.allow-experiments" = false;
          };
        };
      };
    };
  };
}
