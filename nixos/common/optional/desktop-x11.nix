{ pkgs, ... }: {
  programs = { dconf.enable = true; };

  services = {
    dbus = {
      enable = true;
      packages = [ pkgs.gcr ];
    };
    #gnome.gnome-keyring.enable = true;
    fwupd.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;
    printing.enable = true;
    tumbler.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };
}
