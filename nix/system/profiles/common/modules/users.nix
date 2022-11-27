{...}: {
  config = {
    users.users = {
      matt = {
        isNormalUser = true;

        description = "Matt";

        extraGroups = [
          "wheel"
          "networkmanager"
        ];
      };
    };
  };
}
