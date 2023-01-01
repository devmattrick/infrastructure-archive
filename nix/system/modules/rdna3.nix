{
  lib,
  pkgs,
  config,
  ...
}: {
  config = {
    hardware.opengl.package = pkgs.mesa-patched.drivers;
  };
}
