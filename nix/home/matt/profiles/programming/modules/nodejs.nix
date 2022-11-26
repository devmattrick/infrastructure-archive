{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [yarn nodejs];
  };
}
