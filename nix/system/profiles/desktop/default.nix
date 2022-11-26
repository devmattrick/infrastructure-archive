{pkgs, ...}: {
  imports = [
    ./modules/1password.nix
    ./modules/gnome.nix
    ./modules/noisetorch.nix
  ];

  config = {
    # Use xanmod for desktops
    boot.kernelPackages = pkgs.linuxPackagesFor pkgs.linuxKernel.kernels.linux_xanmod;

    boot.supportedFilesystems = ["ntfs"];

    environment.systemPackages = with pkgs; [firefox];

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

    hardware.bluetooth.enable = true;

    security.polkit.enable = true;

    services.printing = {
      enable = true;
      webInterface = false;
    };

    documentation.nixos.enable = false;
  };
}
