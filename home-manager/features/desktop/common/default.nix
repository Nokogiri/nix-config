{ pkgs, ... }: {
  imports = [
    ./firefox.nix
    ./gtk.nix
    ./kdeconnect.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./spotify.nix
  ];

  home.packages = with pkgs; [ lxqt.pavucontrol-qt libnotify xdg_utils ];
}
