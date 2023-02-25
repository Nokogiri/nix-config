{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ cage ];
  services.xserver.displayManager.sddm = {
    enable = true;
    settings = {
      General = {
        DisplayServer = "wayland";
        GreeterEnvironment = "QT_WAYLAND_SHELL_INTEGRATION=layer-shell";
      };
      Wayland = { CompositorCommand = "${pkgs.cage}/bin/cage"; };
    };
  };
}
