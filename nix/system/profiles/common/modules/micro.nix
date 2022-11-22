{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [ micro ];
  };
}
