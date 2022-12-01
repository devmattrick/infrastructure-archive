{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [clang];
  };
}
