{ pkgs, ... }: {
  config = {
    programs.btop = {
      enable = true;
      settings = {
        proc_gradient = false;
      };
    };
  };
}
