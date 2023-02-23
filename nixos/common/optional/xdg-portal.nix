{ pkgs, ... }: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    lxqt.enable = true;
    xdgOpenUsePortal = false;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.lxqt.xdg-desktop-portal-lxqt pkgs.xdg-desktop-portal-gnome ];
  };
}
