{ pkgs, ... }:{

  home.packages = [ pkgs.hyprpaper ];
  
  xdg.configFile."hypr/paper".source = ./hyprpaper;
  
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.config/hypr/paper/Totoro-Sapphire-Night.png
    preload = ~/.config/hypr/paper/Totoro-Sapphire-Day.png
    wallpaper = ,~/.config/hypr/paper/Totoro-Sapphire-Night.png
  '';

  systemd.user.services.hyprpaper = {
    Unit = { Description = "hyprpaper"; };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
      Restart = "on-failure";
    };
    Install = { WantedBy = [ "hyprland-session.target" ]; };
  };
}
