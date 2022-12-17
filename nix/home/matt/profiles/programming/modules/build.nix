{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [clang pkg-config];
  };
}
