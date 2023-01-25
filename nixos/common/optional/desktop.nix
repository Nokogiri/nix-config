{ pkgs, ... }: {
  programs = { dconf.enable = true; };

  services = {
    dbus = {
      enable = true;
      packages = [ pkgs.gcr ];
    };
    #gnome.gnome-keyring.enable = true;
    printing.enable = true;
    # mount external to /media like normal people
    udev.extraRules = ''
      ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"
    '';
    udisks2.enable = true;
    upower.enable = true;
  };
}
