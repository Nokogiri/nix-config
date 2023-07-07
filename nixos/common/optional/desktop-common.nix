{ pkgs, inputs, ... }:
let
  gTheme = "Catppuccin-Mocha-Standard-Flamingo-Dark";
  gAccent = "lavender";
  gFlavor = "frappe";
  kAccent = "Lavender";
  kFlavor = "Frappe";
  catTheme = "Catppuccin-Frappe-Standard-Lavender-dark";
  catppuccin-gt = pkgs.catppuccin-gtk.override {
    accents = [ "lavender" ];
    size = "standard";
    tweaks = [ "rimless" ];
    variant = "frappe";
  };
  catppuccin-icons = pkgs.catppuccin-papirus-folders.override {
    accent = "lavender";
    flavor = "frappe";
  };
  catppuccin-qt = pkgs.catppuccin-kvantum.override {
    accent = "Lavender";
    variant = "Frappe";
  };
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

    # for dolphin?
    libsForQt5.kio-admin
    kio-fuse
    libsForQt5.kdegraphics-thumbnailers
    libsForQt5.kimageformats
    libsForQt5.ffmpegthumbs

    # themepkgs 
    nordzy-cursor-theme
    catppuccin-gt
    catppuccin-qt
    catppuccin-icons
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
