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
  environment.systemPackages = with pkgs; [ gtklock ];
  programs = {
    dconf.enable = true;
    #hyprland = {
    #  enable = true;
    #  package = inputs.hyprland.packages.${pkgs.system}.default; #.override ({
      #  hidpiXWayland = false;
      #});
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
