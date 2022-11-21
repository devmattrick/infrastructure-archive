{ pkgs, ... }: {
  imports = [
    ./modules/1password.nix
    ./modules/noisetorch.nix
  ];

  config = {
    # Use xanmod for desktops
    boot.kernelPackages = pkgs.linuxPackagesFor pkgs.linuxKernel.kernels.linux_xanmod;

    environment.systemPackages = with pkgs; [ firefox ];

    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    security.rtkit.enable = true;

    # Use PipeWire for audio
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    services.dbus.enable = true;
    programs.dconf.enable = true;

    xdg.portal.enable = true;

    hardware.bluetooth.enable = true;

    security.polkit.enable = true;

    services.printing.enable = true;
  };
}
