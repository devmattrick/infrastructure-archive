{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [rustup rust-analyzer];
  };
}
