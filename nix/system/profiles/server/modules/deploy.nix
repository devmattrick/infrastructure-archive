{...}: {
  config = {
    # A user that deploy-rs will use to connect to the server
    users.users.deploy = {
      isNormalUser = true;

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPT+jr+rugel3bLh+3C/jokPU+t9hWKpTFrbLM4j+BbA"
      ];

      extraGroups = ["wheel"];
    };

    # We need to allow passwordless sudo for the deploy user to rebuild the system
    security.sudo.extraRules = [
      {
        users = ["deploy"];
        commands = [
          {
            command = "ALL";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
  };
}
