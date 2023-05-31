{ pkgs, inputs, ... }:
let
  gTheme = "Catppuccin-Mocha-Standard-Flamingo-Dark";
  gAccent = "teal";
  gFlavor = "mocha";
  kAccent = "Rosewater";
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
    (catppuccin-papirus-folders.override {
      accent = gAccent;
      flavor = gFlavor;
    })
  ];

  gtk.iconCache.enable = true;
  qt.style = "Adwaita-Dark";
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
    gvfs.enable = false;
    printing.enable = true;
    tumbler.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };
}
