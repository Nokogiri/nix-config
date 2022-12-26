{ pkgs, ... }: {
  imports = [
    ./firefox
    ./gtk.nix
    ./kdeconnect.nix
    ./mpv.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./spotify.nix
    ./udiskie.nix
    ./youtube.nix
  ];

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    TDESKTOP_DISABLE_GTK_INTEGRATION = "1";
    CLUTTER_BACKEND = "wayland";
    BEMENU_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland-egl";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
    NO_AT_BRIDGE = "1";
    WINIT_UNIX_BACKEND = "wayland";
  };

  home.packages = with pkgs; [
    gimp
    libnotify
    (let
      python-packages-plus = python-packages:
        with python-packages; [
          isort
          evdev
          jinja2
          nose
          pynvim
          pytest
          requests
          unidecode
          setuptools
        ];
      python-with-packages-plus = python3.withPackages python-packages-plus;
    in python-with-packages-plus)
    udiskie
    wezterm
    xournalpp
    xdg_utils
  ];
}
