{ lib, inputs, pkgs, config, ... }: {
  imports = [
    ../common
    ../common/wayland
    ../wallpaper
    inputs.hyprland.homeManagerModules.default
    ./config.nix
  ];

  home.packages = [ inputs.hyprpicker.packages."x86_64-linux".hyprpicker ];

  programs = {
    fish.loginShellInit = ''
      if test (tty) = "/dev/tty1"
        exec systemd-cat --identifier=Hyprland Hyprland &> /dev/null
      end
    '';
    zsh.loginExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec systemd-cat --identifier=Hyprland Hyprland &> /dev/null
      fi
    '';
    zsh.profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec systemd-cat --identifier=Hyprland Hyprland &> /dev/null
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
    package = inputs.hyprland.packages.${pkgs.system}.default;
    xwayland = {
      enable = true;
      hidpi = false;
    };
    recommendedEnvironment = true;
    #extraConfig = (import ./config.nix);
  };
}
