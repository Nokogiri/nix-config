{ pkgs, inputs, ... }:
let
  gTheme = "Catppuccin-Mocha-Standard-Flamingo-Dark";
  gAccent = "lavender";
  gFlavor = "frappe";
  kAccent = "Lavender";
  kFlavor = "Frappe";
in {

  security.pam.services = {
    gtklock = {
      name = "gtklock";
      text = ''
        auth            sufficient      pam_unix.so try_first_pass likeauth nullok
        auth            sufficient      pam_fprintd.so
        auth include login
      '';
    };
  };
  environment.systemPackages = with pkgs; [
    gtklock
    (catppuccin-papirus-folders.override {
      accent = gAccent;
      flavor = gFlavor;
    })
    (catppuccin-gtk.override {
      accents = [ gAccent ];
      variant = gFlavor;
      size = "standard";
      tweaks = [ "rimless" ];
    })
    (catppuccin-kvantum.override {
      accent = kAccent;
      variant = kFlavor;
    })
    # maybe for dolphin?
    libsForQt5.kio-admin
    libsForQt5.dolphin
    kio-fuse
  ];

  environment.pathsToLink = [ "/share/Kvantum" ];

  gtk.iconCache.enable = true;

  qt.style = "Kvantum-Dark";

  programs = {
    dconf.enable = true;
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
        hidpi = false;
      };
    };
  };

  services = {
    dbus = {
      enable = true;
      packages = [ pkgs.gcr ];
    };
    flatpak.enable = true;
    gvfs.enable = true;
    printing.enable = true;
    #tumbler.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };
}
