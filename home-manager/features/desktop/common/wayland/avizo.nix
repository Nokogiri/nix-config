{ pkgs, ... }: {
  home.packages = [ pkgs.avizo ];

  systemd.user.services = {
    avizo-service = {
      Unit = { Description = "User unit for avizo"; };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.avizo}/bin/avizo-service";
      };
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };
  };
}
