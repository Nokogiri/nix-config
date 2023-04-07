{ pkgs, inputs, ... }:
let
  gTheme = "Catppuccin-Mocha-Standard-Flamingo-Dark";
  gAccent = "mauve";
  gFlavor = "mocha";
  kAccent = "Mauve";
  kFlavor = "Mocha";
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
    qtstyleplugin-kvantum-qt6
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
    (catppuccin-papirus-folders.override {
      accent = gAccent;
      flavor = gFlavor;
    })
  ];

  environment.pathsToLink = [ "/share/Kvantum" ];
  gtk.iconCache.enable = true;
  qt.style = "kvantum-dark";
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
    fwupd.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;
    printing.enable = true;
    tumbler.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };
}
