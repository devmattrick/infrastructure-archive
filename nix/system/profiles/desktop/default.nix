{pkgs, ...}: {
  imports = [
    ./modules/1password.nix
    ./modules/gnome.nix
    ./modules/noisetorch.nix
  ];

  config = {
    # Use xanmod for desktops
    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.supportedFilesystems = ["ntfs"];

    environment.systemPackages = with pkgs; [firefox];

    security.rtkit.enable = true;

    networking.networkmanager.enable = true;

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

    hardware.opengl = {
      enable = true;
      driSupport32Bit = true;
    };

    documentation.nixos.enable = false;
  };
}
