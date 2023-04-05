{ pkgs, ... }: {
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    lxqt.enable = false;
    xdgOpenUsePortal = false;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
