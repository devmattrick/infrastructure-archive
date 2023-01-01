{pkgs, ...}: {
  imports = [
    ../profiles/common
    ../profiles/desktop
    ../profiles/gaming
    ../profiles/programming
    ../profiles/cad
  ];

  config = {
    # Enable NoiseTorch at startup. This config will only work on hydrogen, I should probably make it a module at some
    # point to make it more reusable...
    # See: https://github.com/noisetorch/NoiseTorch/wiki/Start-automatically-with-Systemd
    systemd.user.services = {
      noisetorch = {
        Unit = {
          Description = "NoiseTorch Noise Suppression";
          Requires = "sys-devices-pci0000:00-0000:00:02.1-0000:05:00.0-0000:06:0c.0-0000:12:00.0-usb5-5\\x2d5-5\\x2d5.4-5\\x2d5.4:1.0-sound-card2-controlC2.device";
          After = "sys-devices-pci0000:00-0000:00:02.1-0000:05:00.0-0000:06:0c.0-0000:12:00.0-usb5-5\\x2d5-5\\x2d5.4-5\\x2d5.4:1.0-sound-card2-controlC2.device";
        };

        Service = {
          Type = "simple";
          RemainAfterExit = "yes";

          # Using /run/current-system for this probably isn't ideal, but using pkgs.noisetorch seemed to install a different version or something...
          ExecStart = "/run/current-system/sw/bin/noisetorch -i -s alsa_input.usb-BLUE_MICROPHONE_Blue_Snowball_797_2020_11_08_79538-00.mono-fallback -t 95";
          ExecStop = "/run/current-system/sw/bin/noisetorch  -u";
          Restart = "on-failure";
          RestartSec = 3;
        };

        Install = {
          WantedBy = ["default.target"];
        };
      };
    };
  };
}
