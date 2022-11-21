{ lib, pkgs, config, ... }: {
  config = {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [ "nvidia-x11" "nvidia-settings" ];
  };
}
