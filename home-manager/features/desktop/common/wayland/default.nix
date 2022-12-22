{ config, pkgs, ... }: {
  imports = [ ./fuzzel.nix ./gammastep.nix ./kitty.nix ./mako.nix ./waybar.nix ./wofi.nix ];

  home.packages = with pkgs; [
    avizo
    cliphist
    glib.bin
    grim
    imv
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    slurp
    swayidle
    swaylock-effects
    wl-clipboard
    wlr-randr
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = true;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };

  systemd.user.sessionVariables = {
    PATH =
      "/run/wrappers/bin:/home/nokogiri/.nix-profile/bin:/etc/profiles/per-user/nokogiri/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin";
    QT_QPA_PLATFORM = "${config.home.sessionVariables.QT_QPA_PLATFORM}";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORMTHEME =
      "${config.home.sessionVariables.QT_QPA_PLATFORMTHEME}";
  };
}
