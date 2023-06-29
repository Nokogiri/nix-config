{ pkgs, ... }: {
  home.packages = [ pkgs.iio-hyprland ];

  systemd.user.services.iio-hyprland = {
    Unit = { Description = "Rotate My Hyprland!"; };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.iio-hyprland}/bin/iio-hyprland";
      Restart = "on-failure";
    };
    Install = { WantedBy = [ "hyprland-session.target" ]; };
  };
}
