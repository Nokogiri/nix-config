{ inputs, lib, config, pkgs, ... }:
let cfg = config.wayland.windowManager.sway.config;
in {
  imports = [ ./config.nix ../common ../common/wayland ../wallpaper ];

  home.packages = with pkgs; [
    swaybg
    inputs.hyprpicker.packages."x86_64-linux".hyprpicker
    config.nur.repos.misterio.swayfader
  ];

  programs = {
    fish.loginShellInit = ''
      if test (tty) = "/dev/tty1"
        exec systemd-cat --identifier=sway sway &> /dev/null
      end
    '';
    zsh.loginExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec sway &> /dev/null
      fi
    '';
    zsh.profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec sway &> /dev/null
      fi
    '';
  };

  #programs.waybar.systemd = {
  #  enable = true;
  #  target = "sway-session.target";
  #};
}
