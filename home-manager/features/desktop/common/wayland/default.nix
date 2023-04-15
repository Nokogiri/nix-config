{ config, pkgs, ... }: {
  imports = [
    ./avizo.nix
    ./fuzzel.nix
    ./gammastep.nix
    ./mako.nix
    ./obs-studio.nix
    ./waybar.nix
    #./wofi.nix
  ];

  home.packages = with pkgs; [
    cliphist
    glib.bin
    grim
    imv
    slurp
    swayidle
    swaylock-effects
    wl-clipboard
    wlr-randr
  ];

  home.sessionVariables = {
    BEMENU_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };

  systemd.user.sessionVariables = {
    PATH =
      "/run/wrappers/bin:/etc/profiles/per-user/nokogiri/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin";
    QT_QPA_PLATFORM = "${config.home.sessionVariables.QT_QPA_PLATFORM}";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORMTHEME =
      "${config.home.sessionVariables.QT_QPA_PLATFORMTHEME}";
  };
}
