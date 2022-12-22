{ inputs, lib, config, pkgs, ... }:
let cfg = config.wayland.windowManager.sway.config;
in {
  imports = [ ./config.nix ../common ../common/wayland ../wallpaper ];

  home.packages = with pkgs; [ swaybg ];
  programs.waybar.systemd = {
    enable = true;
    target = "sway-session.target";
  };
}
