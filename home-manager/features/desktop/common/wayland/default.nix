{ pkgs, ... }: {
  imports = [ ./gammastep.nix ./kitty.nix ./mako.nix ./waybar.nix ./wofi.nix ];

  home.packages = with pkgs; [
    avizo
    cliphist
    fuzzel
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
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  systemd.user.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
}
