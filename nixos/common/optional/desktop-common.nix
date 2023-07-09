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

    # for dolphin?
    libsForQt5.kio-admin

    # themepkgs 
    nordzy-cursor-theme
    myGTK
    myQT
    myFolders
    libsForQt5.qt5ct  
    qt6Packages.qt6ct 
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  environment.pathsToLink =
    [ "/share/Kvantum" "/share/kservicetypes5" "/share/kservices5" ];

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
