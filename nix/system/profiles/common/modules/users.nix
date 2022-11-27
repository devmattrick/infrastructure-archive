{...}: {
  config = {
    users.users = {
      matt = {
        isNormalUser = true;

        description = "Matt";

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBJ7plqu/62IIaNdHf4QWn8zFM5sJAP0peftiheVOhI5"
        ];

        extraGroups = [
          "wheel"
          "networkmanager"
        ];
      };
    };
  };
}
