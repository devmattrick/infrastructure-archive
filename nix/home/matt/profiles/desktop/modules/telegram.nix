{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [tdesktop];
  };
}
