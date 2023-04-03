{ pkgs, ... }: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    lxqt.enable = false;
    xdgOpenUsePortal = false;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
