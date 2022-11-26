# I'd eventually like to make my own Nix packages for games I install through Lutris but for now I'll use this :)
{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [lutris];
  };
}
