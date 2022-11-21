{ pkgs, ... }: {
  config = {
    home.packages = with pkgs; [ _1password-gui ];
  };
}
