{ pkgs, ... }: {
  imports = [
    ./firefox
    ./gpg-agent.nix
    ./kitty.nix
    ./nnn-desktop.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./rbw.nix
    ./styles.nix
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
    glib.bin
    libnotify
    libsForQt5.polkit-kde-agent
    xdg_utils
  ];
}
