{ pkgs, inputs, ... }: {

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
    (catppuccin-gtk.override {
      accents = [ "mauve" ];
      variant = "mocha";
      size = "standard";
      tweaks = [ "rimless" ];
    })
    (catppuccin-kvantum.override {
      accent = "Mauve";
      variant = "Mocha";
    })
    (catppuccin-papirus-folders.override {
      accent = "mauve";
      flavor = "mocha";
    })
  ];

  environment.pathsToLink = [ "/share/Kvantum" ];
  gtk.iconCache.enable = true;
  #qt.platformTheme = "gtk3";
  qt.style = "kvantum-dark";
  programs = {
    dconf.enable = true;
    #hyprland = {
    #  enable = true;
    #  xwayland = {
    #    enable = true;
    #    hidpi = false;
    #  };
    #};
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
