{ pkgs, ... }: {
  home.packages = [ pkgs.gojq pkgs.jaq pkgs.socat pkgs.wget ];
  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ./config;
  };
}
