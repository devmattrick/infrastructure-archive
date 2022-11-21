{ pkgs, config, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../../profiles/common
    ../../profiles/desktop
    ../../profiles/gaming

    ../../modules/nvidia.nix
  ];

  config = {
    networking.hostName = "hydrogen";
    networking.networkmanager.enable = true;

    time.timeZone = "America/Los_Angeles";
    i18n.defaultLocale = "en_US.utf8";

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";

    # Setup keyfile
    boot.initrd.secrets = {
      "/crypto_keyfile.bin" = null;
    };

    services.xserver = {
      layout = "us";
      xkbVariant = "";
    };

    users.users.matt = {
      isNormalUser = true;

      description = "Matt";

      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };
}
