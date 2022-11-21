{ pkgs, ... }: {
  config = {
    # Use xanmod for desktops
    boot.kernelPackages = pkgs.linuxPackagesFor pkgs.linuxKernel.kernels.linux_xanmod;

    services.xserver.desktopManager.gnome.enable = true;

    security.rtkit.enable = true;

    # Use PipeWire for audio
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    hardware.pulseaudio.enable = false;

    services.dbus.enable = true;
    programs.dconf.enable = true;

    xdg.portal.enable = true;

    hardware.bluetooth.enable = true;
  };
}
