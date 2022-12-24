{ lib, inputs, pkgs, config, ... }: {
  imports = [
    ../common
    ../common/wayland
    ../wallpaper
    inputs.hyprland.homeManagerModules.default
  ];

  home.packages = [
    pkgs.hyprpaper
  ];

  programs = {
    fish.loginShellInit = ''
      if test (tty) = "/dev/tty1"
        exec Hyprland &> /dev/null
      end
    '';
    zsh.loginExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland &> /dev/null
      fi
    '';
    zsh.profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland &> /dev/null
      fi
    '';
  };

  programs.waybar = {
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = false;
    };
    recommendedEnvironment = true;
    extraConfig = (import ./config.nix);
  };
}
