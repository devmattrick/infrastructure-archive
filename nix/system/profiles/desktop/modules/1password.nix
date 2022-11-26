# There's some special configuration required by 1password to get working, so it will be installed globally
{ ... }: {
  config = {
    programs._1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "matt" ];
    };
  };
}
