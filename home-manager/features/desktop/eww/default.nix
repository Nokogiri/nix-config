{ inputs, pkgs, ... }: {
  home.packages = [ pkgs.gojq pkgs.jaq pkgs.socat pkgs.wget pkgs.dig.dnsutils ];
  programs.eww = {
    enable = true;
    package = inputs.eww.packages.x86_64-linux.eww-wayland;
    #pkgs.eww-wayland;
    configDir = ./config;
  };
}
