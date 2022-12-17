# This is kinda an ugly un-Nixy hack to get OpenSSL libraries globally available for projects, but I prefer not to need
# to juggle shell.nix files with VSCode and other tools, so I have instead opted to install them globally.
{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [openssl.dev];

    home.sessionVariables = {
      PKG_CONFIG_PATH = "\${PKG_CONFIG_PATH}:${pkgs.openssl.dev}/lib/pkgconfig";
    };
  };
}
