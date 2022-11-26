# ldns provides the "drill" CLI utility (alternative to dig)
{ pkgs, ... }: {
  config = {
    environment.systemPackages = with pkgs; [ ldns ];
  };
}
