{ pkgs, ... }: {
  imports = [
    ./firefox
    ./gpg-agent.nix
    ./kdeconnect.nix
    ./mpv.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./spotify.nix
    ./thunderbird.nix
    ./udisks.nix
    ./youtube.nix
  ];

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    TDESKTOP_DISABLE_GTK_INTEGRATION = "1";
    CLUTTER_BACKEND = "wayland";
    BEMENU_BACKEND = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    NO_AT_BRIDGE = "1";
    WINIT_UNIX_BACKEND = "wayland";
  };

  home.packages = with pkgs; [
    libnotify
    libsForQt5.polkit-kde-agent
    (let
      python-packages-plus = python-packages:
        with python-packages; [
          pygobject3
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
    xournalpp
    xdg_utils
  ];
}
