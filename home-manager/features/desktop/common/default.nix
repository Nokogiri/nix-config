{ pkgs, ... }: {
  imports = [
    ./firefox.nix
    ./gtk.nix
    ./kdeconnect.nix
    ./mpv.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./spotify.nix
  ];

  home.packages = with pkgs; [
    lxqt.pavucontrol-qt
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
    xdg_utils
  ];
}
