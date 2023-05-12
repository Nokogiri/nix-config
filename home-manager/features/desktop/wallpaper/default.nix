{ pkgs, config, ... }: {
  xdg.dataFile."wallpaper".source = ./pictures;
  home.packages = with pkgs; [ wpaperd ];
  xdg.configFile."wpaperd/output.conf".text = ''
    [default]
    path = "/home/nokogiri/.local/share/wallpaper"
    duration = "30m"
    apply-shadow = true

    [eDP-1]
    path = "/home/nokogiri/.local/share/wallpaper/6.jpeg"
    apply-shadow = true
  '';
}
