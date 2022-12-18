{ pkgs, config, ... }: {
  console = {
    useXkbConfig = true;
    earlySetup = false;
  };

  boot = {
    plymouth = {
      enable = true;
      theme = "spinner-monochrome";
      themePackages = [
        (pkgs.plymouth-spinner-monochrome.override {
          inherit (config.boot.plymouth) logo;
        })
      ];
    };
    loader.timeout = 10;
    kernelParams = [
      "fbcon=nodefer"
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "vt.global_cursor_default=0"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
}
