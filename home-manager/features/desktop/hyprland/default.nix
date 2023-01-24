{ lib, inputs, pkgs, config, ... }: {
  imports = [
    ../common
    ../common/wayland
    ../wallpaper
    inputs.hyprland.homeManagerModules.default
  ];

  home.packages =
    [ pkgs.hyprpaper inputs.hyprpicker.packages."x86_64-linux".hyprpicker ];

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
    #    package = [ inputs.hyprland.packages."x86_64-linux".waybar-hyprland ];
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
    extraConfig = (import ./config.nix);
  };
}
