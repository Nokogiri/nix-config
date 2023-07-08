{ pkgs, inputs, ... }:
{

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
    #libsForQt5.kio-extras
    #kio-fuse
    #libsForQt5.kdegraphics-thumbnailers
    #libsForQt5.kimageformats
    #libsForQt5.ffmpegthumbs
    #libsForQt5.dolphin

    # themepkgs 
    nordzy-cursor-theme
    myCatppuccinGTK
    myCatppuccinQT
    myCatppuccinFolders
  ];

  environment.pathsToLink = [ "/share/Kvantum" "/share/kservicetypes5" "/share/kservices5" ];

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
