{ lib, inputs, pkgs, config, ... }: {
  imports = [ ../common
              ../common/wayland
              ../wallpaper
    inputs.hyprland.homeManagerModules.default ];

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

  nixpkgs.config.packageOverrides = pkgs: {
    waybar = pkgs.waybar.override {
      jackSupport = false;
      mpdSupport = false;
      sndioSupport = false;
    };
  };

  programs.waybar.package = pkgs.waybar.overrideAttrs
    (oa: { mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ]; });

  programs.waybar = {
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };
  systemd.user.sessionVariables = {
    PATH =
      "/usr/bin:/run/current-system/sw/bin:/home/nokogiri/.nix-profile/bin:${pkgs.hyprland}/bin";
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
