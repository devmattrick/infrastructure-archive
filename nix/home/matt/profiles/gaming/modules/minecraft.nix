{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [prismlauncher temurin-jre-bin-17];
  };
}
