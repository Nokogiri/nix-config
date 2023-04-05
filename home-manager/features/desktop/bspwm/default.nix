{ pkgs, ... }:{
  imports = [
    ./sxhkd.nix
  ];
  home.packages = with pkgs; [
    xorg.xinit
  ];
  xsession.windowManager.bspwm = {
    enable = true;
    extraConfigEarly = ''
      pgrep -x sxhkd > /dev/null || sxhkd &
    '';
    monitors = {
      eDP-1 = [
        "I"
        "II"
        "III"
        "IV"
        "V"
        "VI"
        "VII"
        "VIII"
        "IX"
      ];
    };
    settings = {
      border_width = 2;
      window_gap = 12;
      split_ratio = 0.52;
      borderless_monocle = true;
      gapless_monocle = true;
    };
  };  
}
