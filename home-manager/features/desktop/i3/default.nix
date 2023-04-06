{ inputs, lib, config, pkgs, ... }: {
  imports = [ ./config.nix ];
  home.packages = with pkgs; [ feh rofi picom-next ];
  xsession.windowManager.i3.enable = true;
}
