{ pkgs, config, ... }: {
  services.picom = {
    enable = true;
    package = pkgs.picom-next;
    activeOpacity = 1.0;
    backend = "glx";
    #extraConfig = ''
    #  rounded-corners-exclude = ["class_g = 'i3-frame'";]
    #'';
    fade = true;
    fadeDelta = 10;
    fadeExclude =
      [ "window_type *= 'menu'" "name ~= 'Firefox$'" "focused = 1" ];
    fadeSteps = [ 2.8e-2 3.0e-2 ];
    inactiveOpacity = 0.8;
    menuOpacity = 1.0;
    settings = {
      blur = {
        method = "dual_kawase";
        strength = 3;
        deviation = 2.0;
      };
      corner-radius = 0;
    };
    shadow = false;
    shadowExclude =
      [ "window_type *= 'menu'" "name ~= 'Firefox$'" "focused = 1" ];
    vSync = true;
    wintypes = {
      popup_menu = { opacity = config.services.picom.menuOpacity; };
      dropdown_menu = { opacity = config.services.picom.menuOpacity; };
    };

  };
}
