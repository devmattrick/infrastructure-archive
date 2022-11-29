# Software for configuring Logitech gaming mice
{pkgs, ...}: {
  config = {
    environment.systemPackages = with pkgs; [piper];

    services.ratbagd.enable = true;
  };
}
