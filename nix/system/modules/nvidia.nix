{
  lib,
  pkgs,
  config,
  ...
}: {
  config = {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
