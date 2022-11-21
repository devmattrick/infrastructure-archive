{ ... }: {
  config = {
    programs.micro = {
      enable = true;
      settings = ''
        {
          "autosu": true,
          "mkparents": true
        }
      '';
    };
  };
}
