{ inputs, lib, config, pkgs, ... }: {
  imports = [ ./config.nix ../common ../common/picom.nix ../wallpaper ];
  home.packages = with pkgs; [ avizo feh rofi picom-next ];
  xsession.windowManager.i3.enable = true;
}
