{pkgs, ...}: {
  imports = [];

  config = {
    home = {
      packages = with pkgs; [
        freecad
        kicad
      ];
    };
  };
}
