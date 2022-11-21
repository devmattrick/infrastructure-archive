{ pkgs, config, ... }: {
  imports = [

    ../modules/nvidia.nix
    ../profiles/desktop
    ../profiles/gaming
  ];

  config = {
    time.timeZone = "America/Los_Angeles";

    users.users.matt = {
      isNormalUser = true;

      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };
}
