{ pkgs, ... }: {
  imports = [ ./gammastep.nix ./kitty.nix ./mako.nix ];

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
    wl-clipboard
    wlr-randr
  ];
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = true;
    QT_QPA_PLATFORM = "wayland";
  };
}
