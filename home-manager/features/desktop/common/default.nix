{ pkgs, ... }: {
  imports = [
    ./firefox
    ./gpg-agent.nix
    ./kdeconnect.nix
    ./nnn-desktop.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./thunderbird.nix
    ./udisks.nix
    ./youtube.nix
    ./zathura.nix
  ];

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    NO_AT_BRIDGE = "1";
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
